import pytest
from src.backend.validators import FHIRSchemaValidator, SeverityLevel


@pytest.fixture
def validator():
    return FHIRSchemaValidator()


@pytest.fixture
def valid_codesystem():
    return {
        "resourceType": "CodeSystem",
        "id": "test-codes",
        "url": "http://example.com/CodeSystem/test-codes",
        "name": "TestCodes",
        "status": "active",
        "content": "complete",
        "version": "1.0.0",
        "concept": [
            {"code": "code1", "display": "Code 1"},
            {"code": "code2", "display": "Code 2"},
        ]
    }


def test_valid_codesystem(validator, valid_codesystem):
    """Test that a valid CodeSystem passes validation."""
    report = validator.validate(valid_codesystem)
    assert report.valid is True
    assert len(report.issues) == 0


def test_missing_required_field(validator, valid_codesystem):
    """Test validation fails when required field is missing."""
    del valid_codesystem["status"]
    report = validator.validate(valid_codesystem)
    assert report.valid is False
    assert any(i.code == "MISSING_REQUIRED_FIELD" for i in report.issues)


def test_invalid_status(validator, valid_codesystem):
    """Test validation flags invalid status."""
    valid_codesystem["status"] = "invalid-status"
    report = validator.validate(valid_codesystem)
    assert report.valid is False
    assert any(i.code == "INVALID_STATUS" for i in report.issues)


def test_duplicate_codes(validator, valid_codesystem):
    """Test validation detects duplicate codes."""
    valid_codesystem["concept"].append({"code": "code1", "display": "Duplicate"})
    report = validator.validate(valid_codesystem)
    assert report.valid is False
    assert any(i.code == "DUPLICATE_CODE" for i in report.issues)


def test_invalid_semver(validator, valid_codesystem):
    """Test validation flags non-semver versions."""
    valid_codesystem["version"] = "not-a-version"
    report = validator.validate(valid_codesystem)
    assert any(i.code == "INVALID_SEMVER" for i in report.issues)


def test_code_format_validation(validator, valid_codesystem):
    """Test code format enforcement."""
    valid_codesystem["concept"] = [
        {"code": "invalid code!", "display": "Invalid"}
    ]
    report = validator.validate(valid_codesystem, config={"code_format": "alphanumeric"})
    assert any(i.code == "CODE_FORMAT_MISMATCH" for i in report.issues)