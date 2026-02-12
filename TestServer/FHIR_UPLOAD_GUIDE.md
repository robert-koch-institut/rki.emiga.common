# FHIR Package Upload Scripts - Usage Guide

## Overview
Working PowerShell script to upload FHIR resources to the server:

**upload-fhir-resources-v2.ps1** - Upload individual files or folders with built-in authentication

### Authentication
The script is pre-configured with authentication:
- **Username:** admin
- **Password:** <yourpasswordhere>
- **Server:** https://testfhir.demo.emiga-rki.de/fhir

## Quick Start

### Upload 5 EMIGA Packages (In Dependency Order)
```powershell
# Validate all packages first
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.common#1.2.0-alpha.16\package" -Validate
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.orgv#1.1.1\package" -Validate
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.vzd#2.0.0-alpha.18\package" -Validate
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.outbreak#0.1.3\package" -Validate
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.case#0.3.0-alpha.5\package" -Validate

# Upload all packages
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.common#1.2.0-alpha.16\package"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.orgv#1.1.1\package"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.vzd#2.0.0-alpha.18\package"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.outbreak#0.1.3\package"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.case#0.3.0-alpha.5\package"
```

### Upload Single Package
```powershell
# Upload one package from .fhir cache
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.vzd#2.0.0-alpha.18\package"

# Dry run (see what would be uploaded)
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.common#1.2.0-alpha.16\package" -DryRun

# Validate JSON structure only
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.case#0.3.0-alpha.5\package" -Validate
```

### Upload Individual Files
```powershell
# Single file
.\upload-fhir-resources-v2.ps1 -FilePath "CapabilityStatement_TestServer.json"

# All files in folder
.\upload-fhir-resources-v2.ps1 -FolderPath "Examples"

# Validate only
.\upload-fhir-resources-v2.ps1 -FilePath "resource.json" -Validate

# Dry run
.\upload-fhir-resources-v2.ps1 -FolderPath "Examples" -DryRun
```

## Configuration

### 5 EMIGA Packages

Upload in dependency order:

1. **EMIGA Common v1.2.0-alpha.16**  
   `C:\Users\VoulgarisK\.fhir\packages\rki.emiga.common#1.2.0-alpha.16\package`

2. **EMIGA OrgV v1.1.1**  
   `C:\Users\VoulgarisK\.fhir\packages\rki.emiga.orgv#1.1.1\package`

3. **EMIGA VZD v2.0.0-alpha.18**  
   `C:\Users\VoulgarisK\.fhir\packages\rki.emiga.vzd#2.0.0-alpha.18\package`

4. **EMIGA Outbreak v0.1.3**  
   `C:\Users\VoulgarisK\.fhir\packages\rki.emiga.outbreak#0.1.3\package`

5. **EMIGA Case v0.3.0-alpha.5**  
   `C:\Users\VoulgarisK\.fhir\packages\rki.emiga.case#0.3.0-alpha.5\package`

**Dependency Order:** Common → OrgV → VZD → Outbreak → Case

### Script Parameters

```powershell
-FilePath        # Upload a single JSON file
-FolderPath      # Upload all JSON files in a folder (recursive)
-DryRun          # Show what would be uploaded without sending
-Validate        # Validate JSON structure only
-FhirServerUrl   # Override default server (default: https://testfhir.demo.emiga-rki.de/fhir)
-Username        # Override default username (default: admin)
-Password        # Override default password
```

## Features

### Built-in Authentication
- HTTP Basic Authentication pre-configured
- Credentials: admin / sx*738(SacDq
- Base64 encoded authorization header

### Resource Upload
- Uses PUT method with resourceType/id URL pattern
- Requires resources to have both resourceType and id fields
- UTF-8 encoding for all JSON files
- Content-Type: application/fhir+json

### Error Handling
- Displays detailed error messages
- Color-coded output (Green=success, Red=failure)
- Continues processing even if one resource fails
- Summary report at the end

### Validation Mode
Validate JSON structure without uploading:
```powershell
.\upload-fhir-resources-v2.ps1 -FolderPath "path\to\package" -Validate
```

### Dry Run Mode
Test your upload without sending data:
```powershell
.\upload-fhir-resources-v2.ps1 -FolderPath "path\to\package" -DryRun
```

## Examples

### Example 1: Upload All EMIGA Packages
```powershell
# Upload all 5 packages in dependency order
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.common#1.2.0-alpha.16\package"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.orgv#1.1.1\package"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.vzd#2.0.0-alpha.18\package"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.outbreak#0.1.3\package"
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.case#0.3.0-alpha.5\package"
```

### Example 2: Upload Single Package with Validation
```powershell
# Validate first
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.vzd#2.0.0-alpha.18\package" -Validate

# If validation passes, upload
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.vzd#2.0.0-alpha.18\package"
```

### Example 3: Test Before Upload
```powershell
# Dry run first
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.common#1.2.0-alpha.16\package" -DryRun

# If successful, do actual upload
.\upload-fhir-resources-v2.ps1 -FolderPath "C:\Users\VoulgarisK\.fhir\packages\rki.emiga.common#1.2.0-alpha.16\package"
```

### Example 4: Upload Single File
```powershell
# Upload CapabilityStatement
.\upload-fhir-resources-v2.ps1 -FilePath "CapabilityStatement_TestServer.json"
```

## Troubleshooting

### "Path not found" Error
Check that your package paths are correct. Packages are in your FHIR cache:
`C:\Users\VoulgarisK\.fhir\packages\`

List all installed packages:
```powershell
Get-ChildItem "C:\Users\VoulgarisK\.fhir\packages" -Directory
```

### "Upload failed" Error
- Check server connectivity: `https://testfhir.demo.emiga-rki.de/fhir/metadata`
- Verify authentication credentials are correct
- Review error message details in console
- Use -DryRun to test connectivity
- Use -Validate to check JSON structure

### "Missing resourceType or id" Error
- Ensure all resources have a resourceType field
- Ensure all resources have an id field
- The script requires both fields for PUT operations

### "No JSON files found" Warning
- Ensure folder path contains .json files
- Check file extensions (must be .json)
- Verify folder path is correct

### Authentication Issues
Authentication is built-in with these credentials:
- Username: admin
- Password: <yourpasswordhere>

To use different credentials:
```powershell
.\upload-fhir-resources-v2.ps1 -FolderPath "path" -Username "myuser" -Password "mypass"
```

## Server Information

Default server: `https://testfhir.demo.emiga-rki.de/fhir`

**Pre-installed packages on server:**
- ✅ hl7.fhir.r4.core#4.0.1
- ✅ hl7.terminology.r4



### Change Default Server
Edit the `$ServerUrl` parameter at the top of each script, or pass it via command line.

## Tips

1. **Always validate first** - Use `-Validate` to check JSON structure before uploading
2. **Use -DryRun** to see what will be uploaded without sending data
3. **Dependency order matters** - Common package must be uploaded before packages that depend on it
4. **Check server status** - Visit `https://testfhir.demo.emiga-rki.de/fhir/metadata` to verify server is up
5. **Keep logs** - Redirect output to file: `.\upload-fhir-resources-v2.ps1 ... > upload.log 2>&1`
6. **Server auto-resolves dependencies** - Core FHIR and terminology packages are already available
7. **Monitor output** - Green = success, Red = failure, Yellow = dry run/info

## Support

For issues or questions, check:
- FHIR server capability statement: `https://testfhir.demo.emiga-rki.de/fhir/metadata`
- FHIR transaction documentation: https://hl7.org/fhir/http.html#transaction
