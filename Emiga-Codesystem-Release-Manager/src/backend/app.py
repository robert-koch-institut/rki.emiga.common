from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime
import uuid

app = FastAPI(
    title="ECUM Backend API",
    version="0.1.0",
    description="EMIGA Codesystem Update Manager REST API"
)

# Enable CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ConceptModel(BaseModel):
    code: str
    display: str
    definition: Optional[str] = None

class CodeSystemModel(BaseModel):
    id: str
    url: str
    version: str
    name: str
    status: str = "active"
    concepts: List[ConceptModel] = []

class ValidationRequest(BaseModel):
    resourceId: str
    fshContent: str
    strictMode: bool = False

class ValidationReport(BaseModel):
    resourceId: str
    valid: bool
    errors: List[str] = []
    warnings: List[str] = []
    timestamp: datetime

class ReleaseRequest(BaseModel):
    branchName: str
    semverBump: str  # major | minor | patch
    publishToSimplifier: bool = False
    dryRun: bool = True

class ReleaseResponse(BaseModel):
    releaseId: str
    status: str
    branchSha: Optional[str] = None
    packageUrl: Optional[str] = None
    workflowUrl: Optional[str] = None
    timestamp: datetime

# ============ In-Memory Storage (for demo) ============

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

# ============ Health Check ============

@app.get("/api/v1/health")
def health_check():
    return {"status": "ok", "service": "ECUM Backend"}

# ============ Resources Endpoints ============

@app.get("/api/v1/resources", response_model=List[CodeSystemModel])
def list_resources():
    """List all CodeSystem resources"""
    return list(resources_db.values())

@app.get("/api/v1/resources/{resource_id}", response_model=CodeSystemModel)
def get_resource(resource_id: str):
    """Get a specific CodeSystem resource"""
    if resource_id not in resources_db:
        raise HTTPException(status_code=404, detail="Resource not found")
    return resources_db[resource_id]

@app.post("/api/v1/resources", response_model=CodeSystemModel)
def create_resource(resource: CodeSystemModel):
    """Create a new CodeSystem resource"""
    if resource.id in resources_db:
        raise HTTPException(status_code=409, detail="Resource already exists")
    resources_db[resource.id] = resource.dict()
    return resource

@app.put("/api/v1/resources/{resource_id}", response_model=CodeSystemModel)
def update_resource(resource_id: str, resource: CodeSystemModel):
    """Update an existing CodeSystem resource"""
    if resource_id not in resources_db:
        raise HTTPException(status_code=404, detail="Resource not found")
    resources_db[resource_id] = resource.dict()
    return resource

@app.delete("/api/v1/resources/{resource_id}")
def delete_resource(resource_id: str):
    """Delete a CodeSystem resource"""
    if resource_id not in resources_db:
        raise HTTPException(status_code=404, detail="Resource not found")
    del resources_db[resource_id]
    return {"message": "Resource deleted"}

# ============ Validation Endpoint ============

@app.post("/api/v1/validate", response_model=ValidationReport)
def validate_resource(req: ValidationRequest):
    """
    Validate FSH content for a resource.
    This is a placeholder - integrate HAPI/Firely SDK here.
    """
    errors: List[str] = []
    warnings: List[str] = []
    valid = True

    if not req.fshContent or not req.fshContent.strip():
        errors.append("FSH content cannot be empty")
        valid = False

    if "CodeSystem:" not in req.fshContent and "Instance:" not in req.fshContent:
        warnings.append("FSH content may be incomplete - missing CodeSystem or Instance declaration")

    # rudimentary duplicate check against existing resource concepts
    if req.resourceId in resources_db:
        existing_codes = [c["code"] for c in resources_db[req.resourceId].get("concepts", [])]
        if len(existing_codes) != len(set(existing_codes)):
            errors.append("Duplicate codes detected in existing resource")
            valid = False

    return ValidationReport(
        resourceId=req.resourceId,
        valid=valid,
        errors=errors,
        warnings=warnings,
        timestamp=datetime.utcnow()
    )

# ============ Release Management Endpoint ============

@app.post("/api/v1/release/trigger", response_model=ReleaseResponse)
def trigger_release(req: ReleaseRequest):
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

# ============ Root ============

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
