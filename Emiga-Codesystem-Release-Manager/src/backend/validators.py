import json
import re
from typing import Dict, List, Any, Tuple
from dataclasses import dataclass, asdict
from datetime import datetime
from enum import Enum


class SeverityLevel(str, Enum):
    ERROR = "error"
    WARNING = "warning"
    INFO = "info"


@dataclass
class ValidationIssue:
    severity: SeverityLevel
    code: str
    message: str
    path: str
    confidence: float = 1.0  # 0.0-1.0, flagged for manual review if < 0.95


@dataclass
class ValidationReport:
    resource_id: str
    valid: bool
    issues: List[ValidationIssue]
    timestamp: str
    schema_version: str = "FHIR R4"


class FHIRSchemaValidator:
    """Validates FHIR CodeSystem resources against schema rules."""
    
    REQUIRED_CODESYSTEM_FIELDS = [
        "resourceType",
        "id",
        "name",
        "status",
        "content",
    ]
    
    VALID_STATUSES = ["draft", "active", "retired", "unknown"]
    VALID_CONTENT_TYPES = ["not-present", "example", "fragment", "complete", "supplement"]
    
    CODE_FORMAT_PATTERNS = {
        "alphanumeric": r"^[a-zA-Z0-9\-_]+$",
        "snomed": r"^\d{6,18}$",
        "loinc": r"^\d{4,5}-\d$",
        "icd10": r"^[A-Z]\d{2}(\.\d{1,2})?$",
    }
    
    def __init__(self):
        self.issues: List[ValidationIssue] = []
    
    def validate(self, resource: Dict[str, Any], config: Dict[str, Any] = None) -> ValidationReport:
        """
        Main validation entry point.
        
        Args:
            resource: FHIR CodeSystem JSON object
            config: Optional config with code format enforcement, etc.
        
        Returns:
            ValidationReport with issues and validity status
        """
        self.issues = []
        config = config or {}
        
        # Schema validation
        self._validate_resource_type(resource)
        self._validate_required_fields(resource)
        self._validate_status(resource)
        self._validate_content_type(resource)
        
        # Semantic validation
        self._validate_identifier_format(resource, config)
        self._validate_codes(resource, config)
        self._validate_concepts(resource, config)
        self._validate_version(resource)
        
        resource_id = resource.get("id", "unknown")
        valid = all(issue.severity != SeverityLevel.ERROR for issue in self.issues)
        
        return ValidationReport(
            resource_id=resource_id,
            valid=valid,
            issues=self.issues,
            timestamp=datetime.utcnow().isoformat() + "Z",
        )
    
    def _validate_resource_type(self, resource: Dict[str, Any]) -> None:
        """Check resourceType is CodeSystem."""
        rt = resource.get("resourceType")
        if rt != "CodeSystem":
            self.issues.append(ValidationIssue(
                severity=SeverityLevel.ERROR,
                code="INVALID_RESOURCE_TYPE",
                message=f"Expected resourceType 'CodeSystem', got '{rt}'",
                path="resourceType",
            ))
    
    def _validate_required_fields(self, resource: Dict[str, Any]) -> None:
        """Check all required FHIR CodeSystem fields are present."""
        for field in self.REQUIRED_CODESYSTEM_FIELDS:
            if field not in resource or resource[field] is None:
                self.issues.append(ValidationIssue(
                    severity=SeverityLevel.ERROR,
                    code="MISSING_REQUIRED_FIELD",
                    message=f"Required field '{field}' is missing or null",
                    path=field,
                ))
    
    def _validate_status(self, resource: Dict[str, Any]) -> None:
        """Validate CodeSystem status is one of allowed values."""
        status = resource.get("status")
        if status and status not in self.VALID_STATUSES:
            self.issues.append(ValidationIssue(
                severity=SeverityLevel.ERROR,
                code="INVALID_STATUS",
                message=f"Status '{status}' not in allowed values: {self.VALID_STATUSES}",
                path="status",
            ))
    
    def _validate_content_type(self, resource: Dict[str, Any]) -> None:
        """Validate CodeSystem content type."""
        content = resource.get("content")
        if content and content not in self.VALID_CONTENT_TYPES:
            self.issues.append(ValidationIssue(
                severity=SeverityLevel.ERROR,
                code="INVALID_CONTENT_TYPE",
                message=f"Content '{content}' not in allowed values: {self.VALID_CONTENT_TYPES}",
                path="content",
            ))
    
    def _validate_identifier_format(self, resource: Dict[str, Any], config: Dict[str, Any]) -> None:
        """Validate CodeSystem id/identifier format."""
        cs_id = resource.get("id", "")
        
        # Check for valid URL format if url is present
        url = resource.get("url", "")
        if url and not self._is_valid_url(url):
            self.issues.append(ValidationIssue(
                severity=SeverityLevel.WARNING,
                code="INVALID_URL_FORMAT",
                message=f"CodeSystem URL '{url}' does not appear to be a valid URI",
                path="url",
                confidence=0.85,
            ))
        
        # Check ID doesn't contain invalid characters
        if not re.match(r"^[a-zA-Z0-9\-\.]+$", cs_id):
            self.issues.append(ValidationIssue(
                severity=SeverityLevel.ERROR,
                code="INVALID_ID_FORMAT",
                message=f"CodeSystem id '{cs_id}' contains invalid characters",
                path="id",
            ))
    
    def _validate_codes(self, resource: Dict[str, Any], config: Dict[str, Any]) -> None:
        """Validate concept codes against configured format."""
        concepts = resource.get("concept", [])
        code_format = config.get("code_format", "alphanumeric")
        pattern = self.CODE_FORMAT_PATTERNS.get(code_format, self.CODE_FORMAT_PATTERNS["alphanumeric"])
        
        seen_codes = set()
        for idx, concept in enumerate(concepts):
            code = concept.get("code", "")
            
            # Check for duplicates
            if code in seen_codes:
                self.issues.append(ValidationIssue(
                    severity=SeverityLevel.ERROR,
                    code="DUPLICATE_CODE",
                    message=f"Duplicate code '{code}' found",
                    path=f"concept[{idx}].code",
                ))
            seen_codes.add(code)
            
            # Check format
            if code and not re.match(pattern, code):
                self.issues.append(ValidationIssue(
                    severity=SeverityLevel.WARNING,
                    code="CODE_FORMAT_MISMATCH",
                    message=f"Code '{code}' does not match format '{code_format}'",
                    path=f"concept[{idx}].code",
                    confidence=0.90,
                ))
    
    def _validate_concepts(self, resource: Dict[str, Any], config: Dict[str, Any]) -> None:
        """Validate concept structure and required fields."""
        concepts = resource.get("concept", [])
        
        for idx, concept in enumerate(concepts):
            if not isinstance(concept, dict):
                self.issues.append(ValidationIssue(
                    severity=SeverityLevel.ERROR,
                    code="INVALID_CONCEPT_STRUCTURE",
                    message=f"Concept at index {idx} is not a valid object",
                    path=f"concept[{idx}]",
                ))
                continue
            
            # Check required code field
            if "code" not in concept or not concept["code"]:
                self.issues.append(ValidationIssue(
                    severity=SeverityLevel.ERROR,
                    code="MISSING_CONCEPT_CODE",
                    message=f"Concept at index {idx} missing required 'code' field",
                    path=f"concept[{idx}].code",
                ))
            
            # Check display is present
            if "display" not in concept:
                self.issues.append(ValidationIssue(
                    severity=SeverityLevel.WARNING,
                    code="MISSING_DISPLAY",
                    message=f"Concept '{concept.get('code')}' missing 'display' field",
                    path=f"concept[{idx}].display",
                    confidence=0.95,
                ))
    
    def _validate_version(self, resource: Dict[str, Any]) -> None:
        """Validate version follows semantic versioning."""
        version = resource.get("version", "")
        if version:
            if not self._is_valid_semver(version):
                self.issues.append(ValidationIssue(
                    severity=SeverityLevel.WARNING,
                    code="INVALID_SEMVER",
                    message=f"Version '{version}' does not follow semantic versioning (X.Y.Z)",
                    path="version",
                    confidence=0.90,
                ))
    
    @staticmethod
    def _is_valid_url(url: str) -> bool:
        """Simple URL validation."""
        return url.startswith(("http://", "https://", "urn:")) and len(url) > 5
    
    @staticmethod
    def _is_valid_semver(version: str) -> bool:
        """Validate semantic version format X.Y.Z."""
        pattern = r"^\d+\.\d+\.\d+(-[a-zA-Z0-9]+)?$"
        return bool(re.match(pattern, version))


class ValidationReportEncoder(json.JSONEncoder):
    """Custom JSON encoder for ValidationReport and related dataclasses."""
    
    def default(self, obj):
        if isinstance(obj, (ValidationReport, ValidationIssue)):
            return asdict(obj)
        if isinstance(obj, Enum):
            return obj.value
        return super().default(obj)


def generate_validation_report_json(report: ValidationReport) -> str:
    """Serialize a ValidationReport to JSON with proper formatting."""
    return json.dumps(report, cls=ValidationReportEncoder, indent=2)