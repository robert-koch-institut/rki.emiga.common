param(
    [Parameter(Mandatory=$false)]
    [string]$FilePath,
    
    [Parameter(Mandatory=$false)]
    [string]$FolderPath,
    
    [Parameter(Mandatory=$false)]
    [switch]$DryRun,
    
    [Parameter(Mandatory=$false)]
    [switch]$Validate,
    
    [Parameter(Mandatory=$false)]
    [string]$FhirServerUrl = "https://testfhir.demo.emiga-rki.de/fhir",
    
    [Parameter(Mandatory=$false)]
    [string]$Username = "admin",
    
    [Parameter(Mandatory=$false)]
    [string]$Password = "sx*738(SacDq"
)

function Send-FhirResource {
    param(
        [string]$ResourcePath,
        [string]$ServerUrl,
        [string]$User,
        [string]$Pass,
        [bool]$IsDryRun,
        [bool]$IsValidate
    )
    
    try {
        $content = Get-Content -Path $ResourcePath -Raw -Encoding UTF8
        $resource = $content | ConvertFrom-Json
        
        if ($IsValidate) {
            Write-Host "  Valid JSON: $ResourcePath" -ForegroundColor Green
            return $true
        }
        
        if ($IsDryRun) {
            Write-Host "  Would upload: $ResourcePath" -ForegroundColor Yellow
            return $true
        }
        
        $resourceType = $resource.resourceType
        $resourceId = $resource.id
        
        if (-not $resourceType -or -not $resourceId) {
            Write-Host "  Missing resourceType or id in $ResourcePath" -ForegroundColor Red
            return $false
        }
        
        # Create auth header
        $pair = "${User}:${Pass}"
        $bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
        $base64 = [System.Convert]::ToBase64String($bytes)
        
        $headers = @{
            "Content-Type" = "application/fhir+json"
            "Authorization" = "Basic $base64"
        }
        
        $url = "$ServerUrl/$resourceType/$resourceId"
        
        $response = Invoke-RestMethod -Uri $url -Method Put -Body $content -Headers $headers -ContentType "application/fhir+json"
        
        Write-Host "  Uploaded: $resourceType/$resourceId" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "  Failed: $ResourcePath - $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Main logic
$success = 0
$failed = 0

Write-Host "FHIR Resource Upload" -ForegroundColor Cyan
Write-Host "Server: $FhirServerUrl" -ForegroundColor Gray

if ($DryRun) {
    Write-Host "Mode: DRY RUN" -ForegroundColor Yellow
}
elseif ($Validate) {
    Write-Host "Mode: VALIDATE ONLY" -ForegroundColor Yellow
}
else {
    Write-Host "Mode: UPLOAD" -ForegroundColor Green
}

Write-Host ""

if ($FilePath) {
    if (-not (Test-Path $FilePath)) {
        Write-Host "File not found: $FilePath" -ForegroundColor Red
        exit 1
    }
    
    Write-Host "Processing file: $FilePath"
    $result = Send-FhirResource -ResourcePath $FilePath -ServerUrl $FhirServerUrl -User $Username -Pass $Password -IsDryRun $DryRun -IsValidate $Validate
    
    if ($result) { $success++ } else { $failed++ }
}
elseif ($FolderPath) {
    if (-not (Test-Path $FolderPath)) {
        Write-Host "Folder not found: $FolderPath" -ForegroundColor Red
        exit 1
    }
    
    Write-Host "Processing folder: $FolderPath"
    $files = Get-ChildItem -Path $FolderPath -Filter "*.json" -Recurse
    
    Write-Host "Found $($files.Count) JSON files" -ForegroundColor Gray
    Write-Host ""
    
    foreach ($file in $files) {
        $result = Send-FhirResource -ResourcePath $file.FullName -ServerUrl $FhirServerUrl -User $Username -Pass $Password -IsDryRun $DryRun -IsValidate $Validate
        if ($result) { $success++ } else { $failed++ }
    }
}
else {
    Write-Host "Error: Must specify -FilePath or -FolderPath" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Summary:" -ForegroundColor Cyan

if ($success -gt 0) {
    Write-Host "  Success: $success" -ForegroundColor Green
}
else {
    Write-Host "  Success: $success" -ForegroundColor Gray
}

if ($failed -gt 0) {
    Write-Host "  Failed: $failed" -ForegroundColor Red
}
else {
    Write-Host "  Failed: $failed" -ForegroundColor Gray
}

Write-Host "========================================" -ForegroundColor Cyan

if ($failed -gt 0) {
    exit 1
}
