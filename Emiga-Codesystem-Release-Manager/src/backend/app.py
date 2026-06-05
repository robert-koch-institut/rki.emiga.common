from fastapi import FastAPI, HTTPException, Depends, Header
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
from typing import List, Optional, Dict, Any
from datetime import datetime
import uuid

from sqlalchemy.orm import Session

from .db import get_db, init_db, verify_password
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
    code: str = Field(..., description="Concept code")
    display: str = Field(..., description="Concept display text")
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


def create_token(username: str, role: str) -> str:
    token = f"{username}-{uuid.uuid4().hex}"
    TOKEN_STORE[token] = {
        "username": username,
        "role": role,
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


def resource_to_dict(resource: CodeSystemResource) -> Dict[str, Any]:
    return {
        "id": resource.id,
        "url": resource.url,
        "version": resource.version,
        "name": resource.name,
        "status": resource.status,
        "concepts": resource.concepts or [],
    }


@app.on_event("startup")
def on_startup():
    init_db()


@app.post("/api/v1/auth/login", response_model=AuthResponse)
def login(req: AuthRequest, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == req.username).first()
    if not user or not verify_password(req.password, user.password_hash):
        raise HTTPException(status_code=401, detail="Invalid username or password")

    token = create_token(user.username, user.role)
    return AuthResponse(
        access_token=token,
        username=user.username,
        role=user.role,
    )


@app.post("/api/v1/auth/logout")
def logout(authorization: Optional[str] = Header(None)):
    if not authorization or not authorization.startswith("Bearer "):
        raise HTTPException(status_code=401, detail="Missing or invalid Authorization header")

    token = authorization.split(" ", 1)[1]
    TOKEN_STORE.pop(token, None)
    return {"message": "Logged out"}


@app.get("/api/v1/health")
def health_check():
    return {"status": "ok", "service": "ECUM Backend"}


@app.get("/api/v1/resources", response_model=List[CodeSystemModel])
def list_resources(
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    items = db.query(CodeSystemResource).all()
    return [resource_to_dict(item) for item in items]


@app.get("/api/v1/resources/{resource_id}", response_model=CodeSystemModel)
def get_resource(
    resource_id: str,
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    resource = db.query(CodeSystemResource).filter(CodeSystemResource.id == resource_id).first()
    if not resource:
        raise HTTPException(status_code=404, detail="Resource not found")
    return resource_to_dict(resource)


@app.post("/api/v1/resources", response_model=CodeSystemModel)
def create_resource(
    resource: CodeSystemModel,
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    if db.query(CodeSystemResource).filter(CodeSystemResource.id == resource.id).first():
        raise HTTPException(status_code=409, detail="Resource already exists")
    db_resource = CodeSystemResource(**resource.dict())
    db.add(db_resource)
    db.commit()
    return resource


@app.put("/api/v1/resources/{resource_id}", response_model=CodeSystemModel)
def update_resource(
    resource_id: str,
    resource: CodeSystemModel,
    current_user: Dict[str, Any] = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    db_resource = db.query(CodeSystemResource).filter(CodeSystemResource.id == resource_id).first()
    if not db_resource:
        raise HTTPException(status_code=404, detail="Resource not found")

    for key, value in resource.dict().items():
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
    db_resource = db.query(CodeSystemResource).filter(CodeSystemResource.id == resource_id).first()
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
