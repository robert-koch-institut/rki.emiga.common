import json
import os
from pathlib import Path
from fastapi import FastAPI, HTTPException, Depends, Header
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
from typing import List, Optional, Dict, Any
from datetime import datetime
import uuid

from sqlalchemy.orm import Session

from .db import get_db, init_db, verify_password, get_password_hash
from .models import User, CodeSystemResource
from .validators import FHIRSchemaValidator

app = FastAPI(
    title="EMIGA Release Manager API",
    description="FHIR CodeSystem release automation",
    version="0.1.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class CodeSystemConceptModel(BaseModel):
    code: str
    display: str
    definition: Optional[str] = None


class CodeSystemModel(BaseModel):
    id: str
    url: str
    version: str
    name: str
    status: str
    concepts: List[CodeSystemConceptModel]


class ReleaseRequest(BaseModel):
    resource_id: str
    target_env: Optional[str] = "sandbox"
    description: Optional[str] = None


class ReleaseResponse(BaseModel):
    releaseId: str
    status: str
    branchSha: Optional[str]
    packageUrl: Optional[str]
    workflowUrl: Optional[str]
    timestamp: datetime


class AuthRequest(BaseModel):
    username: str
    password: str


class AuthResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
    username: str
    role: str


class ValidationRequest(BaseModel):
    resource: Dict[str, Any]
    config: Optional[Dict[str, Any]] = None


TOKEN_STORE: Dict[str, Dict[str, Any]] = {}


def create_token(user: User) -> str:
    token = f"{user.username}-{uuid.uuid4().hex}"
    TOKEN_STORE[token] = {
        "user_id": user.id,
        "username": user.username,
        "role": user.role,
        "created_at": datetime.utcnow().isoformat(),
    }
    return token


def get_current_user(authorization: Optional[str] = Header(None)) -> Dict[str, Any]:
    if not authorization or not authorization.startswith("Bearer "):
        raise HTTPException(status_code=401, detail="Missing or invalid Authorization header")

    token = authorization.split(" ", 1)[1]
    session = TOKEN_STORE.get(token)
    if not session:
        raise HTTPException(status_code=401, detail="Invalid or expired token")
    return session


def normalize_resource_payload(resource: dict) -> dict:
    return {
        "resource_id": resource.get("id"),
        "url": resource.get("url", ""),
        "name": resource.get("name", ""),
        "status": resource.get("status", "unknown"),
        "version": resource.get("version", ""),
        "concepts": resource.get("concept", []) or [],
    }


def resource_to_dict(resource: CodeSystemResource) -> Dict[str, Any]:
    return {
        "id": resource.resource_id,
        "url": resource.url,
        "version": resource.version,
        "name": resource.name,
        "status": resource.status,
        "concepts": resource.concepts or [],
    }


def get_fsh_resources_folder() -> Path:
    env_path = os.environ.get("FSH_RESOURCES_PATH")
    if env_path:
        path = Path(env_path).expanduser()
        if path.exists():
            return path

    repo_root = Path(__file__).resolve().parents[3]
    candidates = [
        repo_root / "fsh-generated" / "resources",
        repo_root.parent / "rki.emiga.common" / "fsh-generated" / "resources",
        repo_root.parent / "rki.emiga.common" / "rki.emiga.common" / "fsh-generated" / "resources",
    ]
    for candidate in candidates:
        if candidate.exists():
            return candidate

    raise HTTPException(
        status_code=500,
        detail="FSH resources folder not found. Set FSH_RESOURCES_PATH or place fsh-generated/resources next to the repo."
    )


def load_fsh_codesystems() -> List[Dict[str, Any]]:
    folder = get_fsh_resources_folder()
    results = []
    for json_path in folder.glob("CodeSystem-*.json"):
        data = json.loads(json_path.read_text(encoding="utf-8"))
        if data.get("resourceType") != "CodeSystem":
            continue
        results.append({
            "id": data.get("id"),
            "name": data.get("name"),
            "url": data.get("url"),
            "status": data.get("status"),
            "version": data.get("version"),
            "concepts_count": len(data.get("concept", []) or []),
        })
    return sorted(results, key=lambda item: item["name"] or item["id"])


def load_fsh_codesystem(resource_id: str) -> Optional[Dict[str, Any]]:
    folder = get_fsh_resources_folder()
    for json_path in folder.glob("CodeSystem-*.json"):
        data = json.loads(json_path.read_text(encoding="utf-8"))
        if data.get("resourceType") == "CodeSystem" and data.get("id") == resource_id:
            return data
    return None


@app.on_event("startup")
def on_startup():
    init_db()


@app.get("/api/v1/fsh-codesystems")
def list_fsh_codesystems(
    current_user: Dict[str, Any] = Depends(get_current_user),
):
    return load_fsh_codesystems()


@app.post("/api/v1/fsh-codesystems/import/{resource_id}", response_model=CodeSystemModel)
def import_fsh_codesystem(
    resource_id: str,
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    resource = load_fsh_codesystem(resource_id)
    if not resource:
        raise HTTPException(status_code=404, detail="FSH CodeSystem not found")

    normalized = normalize_resource_payload(resource)
    if db.query(CodeSystemResource).filter(
        CodeSystemResource.resource_id == normalized["resource_id"],
        CodeSystemResource.user_id == current_user["user_id"],
    ).first():
        raise HTTPException(status_code=409, detail="CodeSystem already imported")

    db_resource = CodeSystemResource(
        id=f"{current_user['user_id']}:{normalized['resource_id']}",
        resource_id=normalized["resource_id"],
        url=normalized["url"],
        name=normalized["name"],
        status=normalized["status"],
        version=normalized["version"],
        concepts=normalized["concepts"],
        user_id=current_user["user_id"],
    )
    db.add(db_resource)
    db.commit()
    db.refresh(db_resource)
    return resource_to_dict(db_resource)


@app.get("/api/v1/resources", response_model=List[CodeSystemModel])
def list_resources(
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    items = db.query(CodeSystemResource).filter(CodeSystemResource.user_id == current_user["user_id"]).all()
    return [resource_to_dict(item) for item in items]


@app.get("/api/v1/resources/{resource_id}", response_model=CodeSystemModel)
def get_resource(
    resource_id: str,
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    resource = (
        db.query(CodeSystemResource)
        .filter(
            CodeSystemResource.resource_id == resource_id,
            CodeSystemResource.user_id == current_user["user_id"],
        )
        .first()
    )
    if not resource:
        raise HTTPException(status_code=404, detail="Resource not found")
    return resource_to_dict(resource)


@app.post("/api/v1/resources", response_model=CodeSystemModel)
def create_resource(
    resource: CodeSystemModel,
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    if db.query(CodeSystemResource).filter(
        CodeSystemResource.resource_id == resource.id,
        CodeSystemResource.user_id == current_user["user_id"],
    ).first():
        raise HTTPException(status_code=409, detail="Resource already exists")

    db_resource = CodeSystemResource(
        id=f"{current_user['user_id']}:{resource.id}",
        resource_id=resource.id,
        url=resource.url,
        name=resource.name,
        status=resource.status,
        version=resource.version,
        concepts=resource.concepts,
        user_id=current_user["user_id"],
    )
    db.add(db_resource)
    db.commit()
    db.refresh(db_resource)
    return resource_to_dict(db_resource)


@app.put("/api/v1/resources/{resource_id}", response_model=CodeSystemModel)
def update_resource(
    resource_id: str,
    resource: CodeSystemModel,
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    db_resource = (
        db.query(CodeSystemResource)
        .filter(
            CodeSystemResource.resource_id == resource_id,
            CodeSystemResource.user_id == current_user["user_id"],
        )
        .first()
    )
    if not db_resource:
        raise HTTPException(status_code=404, detail="Resource not found")

    for key, value in resource.dict().items():
        if key == "id":
            continue
        setattr(db_resource, key, value)

    db.commit()
    db.refresh(db_resource)
    return resource_to_dict(db_resource)


@app.delete("/api/v1/resources/{resource_id}")
def delete_resource(
    resource_id: str,
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    db_resource = (
        db.query(CodeSystemResource)
        .filter(
            CodeSystemResource.resource_id == resource_id,
            CodeSystemResource.user_id == current_user["user_id"],
        )
        .first()
    )
    if not db_resource:
        raise HTTPException(status_code=404, detail="Resource not found")
    db.delete(db_resource)
    db.commit()
    return {"message": "Resource deleted"}


@app.post("/api/v1/release/trigger", response_model=ReleaseResponse)
def trigger_release(req: ReleaseRequest, current_user: Dict[str, Any] = Depends(get_current_user)):
    rid = str(uuid.uuid4())
    return ReleaseResponse(
        releaseId=rid,
        status="pending",
        branchSha=None,
        packageUrl=None,
        workflowUrl=None,
        timestamp=datetime.utcnow()
    )


@app.post("/validate")
def validate_codesystem(req: ValidationRequest):
    validator = FHIRSchemaValidator()
    report = validator.validate(req.resource, req.config)
    return {
        "resource_id": report.resource_id,
        "valid": report.valid,
        "issues_count": len(report.issues),
        "errors_count": sum(1 for i in report.issues if i.severity == report.issues[0].severity.ERROR),
        "warnings_count": sum(1 for i in report.issues if i.severity == report.issues[0].severity.WARNING),
        "issues": [issue.__dict__ for issue in report.issues],
    }


@app.get("/")
def root():
    return {
        "service": "ECUM Backend API",
        "version": "0.1.0",
        "docs_url": "/docs",
        "healthcheck": "/api/v1/health"
    }


@app.post("/api/v1/auth/login", response_model=AuthResponse)
def login(req: AuthRequest, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == req.username).first()
    if not user or not verify_password(req.password, user.password_hash):
        raise HTTPException(status_code=401, detail="Invalid username or password")

    access_token = create_token(user)
    return AuthResponse(
        access_token=access_token,
        username=user.username,
        role=user.role,
    )


@app.post("/api/v1/auth/signup", response_model=AuthResponse)
def signup(req: AuthRequest, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == req.username).first()
    if user:
        raise HTTPException(status_code=409, detail="Username already exists")

    new_user = User(
        username=req.username,
        hashed_password=get_password_hash(req.password),
        role="user",  # default role
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    access_token = create_token(new_user)
    return AuthResponse(
        access_token=access_token,
        username=new_user.username,
        role=new_user.role,
    )
