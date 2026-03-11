# FHIR Package Upload Scripts - Usage Guide

## Overview
`upload-fhir-resources-v2.ps1` uploads FHIR JSON resources to an R4 HAPI FHIR JPA server.

Current capabilities:
- Upload a single file or a folder (recursive)
- Dry run and JSON validation modes
- Secure authentication via `PSCredential` or password prompt
- Optional example upload (`-IncludeExamples`)
- Optional POST fallback for resources without `id` (`-PostWhenIdMissing`)
- Automatic retry passes for missing-reference example uploads (`HAPI-1094`)
- JSON outcome report + manual-fix text report

Default server:
- `https://testfhir.demo.emiga-rki.de/fhir`

## Authentication
No plaintext password is stored in script parameters.

Use one of:
1. Pass `-Credential`.
2. Pass `-Username` and let script prompt for password in upload mode.

Notes:
- In `-DryRun`/`-Validate` modes, no credential is required.
- If `-Credential` is passed, `-Username` is ignored and the credential username is used.

Recommended command:
```powershell
$cred = Microsoft.PowerShell.Security\Get-Credential -UserName "admin"
```

## Parameters
```powershell
-FilePath            # Single JSON file
-FolderPath          # Folder of JSON files (recursive)
-DryRun              # Print what would be uploaded
-Validate            # Validate JSON only (no upload)
-IncludeExamples     # Include files under '\examples\' (default: false)
-PostWhenIdMissing   # POST /{resourceType} when id is missing
-FhirServerUrl       # Server base URL
-Username            # Username for prompted credential mode
-Credential          # PSCredential for Basic auth
-OutcomeReportPath   # JSON report path
-ManualFixReportPath # Text report with required manual content fixes
```

Validation rules:
- Exactly one of `-FilePath` or `-FolderPath` is required.
- `package.json` and `.index.json` are always skipped.
- `examples` are skipped unless `-IncludeExamples` is provided.

## Upload Behavior
- Standard upload uses `PUT /{resourceType}/{id}`.
- If `id` is missing:
  - with `-PostWhenIdMissing`: uses `POST /{resourceType}`
  - without it: marks entry as failed (`Missing id`).
- In `-IncludeExamples` upload mode, script runs up to 5 passes and retries only missing-reference failures (`HAPI-1094`).
- If a retry pass makes zero progress, deferred files are attempted one final time and processing stops.

## Reports
### Outcome report (JSON)
Default file:
- `TestServer\fhir-upload-outcomes-yyyyMMdd-HHmmss.json`

Each entry includes:
- `Timestamp`, `FilePath`, `ResourceType`, `ResourceId`
- `Action` (`Validation`, `Validate`, `DryRun`, `Upload`, `UploadPost`)
- `Success`, `HttpStatus`, `Message`
- `OperationOutcome` summary (if server returns one)

### Manual-fix report (TXT)
Default file:
- `TestServer\fhir-manual-fixes-yyyyMMdd-HHmmss.txt`

Generated only when failures require content edits (for example):
- Numeric-only IDs rejected by server (`HAPI-0960`)
- Broken/missing references (`HAPI-1094`)

The report includes per-file suggestions inferred from server diagnostics and package IDs.

## Typical Commands
### Validate a package
```powershell
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\path\to\package" -Validate
```

### Upload package (without examples)
```powershell
$cred = Microsoft.PowerShell.Security\Get-Credential -UserName "admin"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\path\to\package" -Credential $cred
```

### Upload package with examples and POST fallback
```powershell
$cred = Microsoft.PowerShell.Security\Get-Credential -UserName "admin"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\path\to\package" -Credential $cred -IncludeExamples -PostWhenIdMissing
```

### Custom report locations
```powershell
$cred = Microsoft.PowerShell.Security\Get-Credential -UserName "admin"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\path\to\package" -Credential $cred -OutcomeReportPath ".\outcomes.json" -ManualFixReportPath ".\manual-fixes.txt"
```

## Exit Code
- `0`: all processed entries succeeded or were intentionally skipped.
- `1`: at least one processed entry failed.

## Troubleshooting
### `HAPI-1094` missing referenced resource
- Cause: dependency ordering or broken reference id.
- Script behavior: retries across passes when examples are enabled.
- If still failing: use `fhir-manual-fixes-*.txt` and update referenced ids in package manually.

### `HAPI-0960` numeric ID rejected
- Cause: server disallows client-assigned purely numeric `id`.
- Fix: change `id` to include at least one non-numeric character and update all references.

### `Get-Credential` prompts for unexpected parameters
- You may have a shadowed function.
- Use fully-qualified cmdlet:
  - `Microsoft.PowerShell.Security\Get-Credential -UserName "admin"`

### Upload summary crashes or strict-mode property errors
- Use latest script version from this repository.
- Re-run and inspect latest `fhir-upload-outcomes-*.json` + `fhir-manual-fixes-*.txt`.
