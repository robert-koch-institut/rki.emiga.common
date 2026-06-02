from fastapi import FastAPI, HTTPException, Depends, Header
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
from typing import List, Optional, Dict, Any
from datetime import datetime
import uuid

from .validators import FHIRSchemaValidator, generate_validation_report_json

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

USER_STORE = {
    "admin": {"password": "password123", "role": "admin"},
    "editor": {"password": "editor1", "role": "editor"},
}

TOKEN_STORE: Dict[str, Dict[str, Any]] = {}

def create_token(username: str) -> str:
    token = f"{username}-{uuid.uuid4().hex}"
    TOKEN_STORE[token] = {
        "username": username,
        "role": USER_STORE[username]["role"],
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

@app.post("/api/v1/auth/login", response_model=AuthResponse)
def login(req: AuthRequest):
    account = USER_STORE.get(req.username)
    if not account or account["password"] != req.password:
        raise HTTPException(status_code=401, detail="Invalid username or password")

    token = create_token(req.username)
    return AuthResponse(
        access_token=token,
        username=req.username,
        role=account["role"],
    )

@app.post("/api/v1/auth/logout")
def logout(authorization: Optional[str] = Header(None)):
    if not authorization or not authorization.startswith("Bearer "):
        raise HTTPException(status_code=401, detail="Missing or invalid Authorization header")

    token = authorization.split(" ", 1)[1]
    TOKEN_STORE.pop(token, None)
    return {"message": "Logged out"}

resources_db = {
    "cs-001": {
        "id": "cs-001",
        "url": "http://example.com/codesystems/cs-001",
        "version": "1.0.0",
        "name": "ExampleCodeSystem",
        "status": "active",
        "concepts": [
            {"code": "active", "display": "Active", "definition": "The resource is active"},
            {"code": "inactive", "display": "Inactive", "definition": "The resource is inactive"}
        ]
    }
}

@app.get("/api/v1/health")
def health_check():
    return {"status": "ok", "service": "ECUM Backend"}

@app.get("/api/v1/resources", response_model=List[CodeSystemModel])
def list_resources(current_user: Dict[str, Any] = Depends(get_current_user)):
    """List all CodeSystem resources"""
    return list(resources_db.values())

@app.get("/api/v1/resources/{resource_id}", response_model=CodeSystemModel)
def get_resource(resource_id: str, current_user: Dict[str, Any] = Depends(get_current_user)):
    """Get a specific CodeSystem resource"""
    if resource_id not in resources_db:
        raise HTTPException(status_code=404, detail="Resource not found")
    return resources_db[resource_id]

@app.post("/api/v1/resources", response_model=CodeSystemModel)
def create_resource(resource: CodeSystemModel, current_user: Dict[str, Any] = Depends(get_current_user)):
    """Create a new CodeSystem resource"""
    if resource.id in resources_db:
        raise HTTPException(status_code=409, detail="Resource already exists")
    resources_db[resource.id] = resource.dict()
    return resource

@app.put("/api/v1/resources/{resource_id}", response_model=CodeSystemModel)
def update_resource(resource_id: str, resource: CodeSystemModel, current_user: Dict[str, Any] = Depends(get_current_user)):
    """Update an existing CodeSystem resource"""
    if resource_id not in resources_db:
        raise HTTPException(status_code=404, detail="Resource not found")
    resources_db[resource_id] = resource.dict()
    return resource

@app.delete("/api/v1/resources/{resource_id}")
def delete_resource(resource_id: str, current_user: Dict[str, Any] = Depends(get_current_user)):
    """Delete a CodeSystem resource"""
    if resource_id not in resources_db:
        raise HTTPException(status_code=404, detail="Resource not found")
    del resources_db[resource_id]
    return {"message": "Resource deleted"}

@app.post("/api/v1/release/trigger", response_model=ReleaseResponse)
def trigger_release(req: ReleaseRequest, current_user: Dict[str, Any] = Depends(get_current_user)):
    """
    Trigger a release pipeline.
    In production, this would:
    1. Create a git branch
    2. Trigger GitHub Actions
    3. Return workflow URL
    """
    # Prototype: return a pending release with generated id
    rid = str(uuid.uuid4())
    return ReleaseResponse(
        releaseId=rid,
        status="pending",
        branchSha=None,
        packageUrl=None,
        workflowUrl=None,
        timestamp=datetime.utcnow()
    )

@app.get("/")
def root():
    return {
        "service": "ECUM Backend API",
        "version": "0.1.0",
        "docs_url": "/docs",
        "healthcheck": "/api/v1/health"
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=5000)
