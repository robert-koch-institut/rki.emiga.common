[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [string]$FilePath,

    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [string]$FolderPath,

    [Parameter(Mandatory = $false)]
    [switch]$DryRun,

    [Parameter(Mandatory = $false)]
    [switch]$Validate,

    [Parameter(Mandatory = $false)]
    [switch]$IncludeExamples,

    [Parameter(Mandatory = $false)]
    [switch]$PostWhenIdMissing,

    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [string]$FhirServerUrl = "https://testfhir.demo.emiga-rki.de/fhir",

    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [string]$Username = "admin",

    [Parameter(Mandatory = $false)]
    [System.Management.Automation.PSCredential]$Credential,

    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [string]$OutcomeReportPath = (Join-Path -Path $PSScriptRoot -ChildPath ("fhir-upload-outcomes-{0}.json" -f (Get-Date -Format "yyyyMMdd-HHmmss"))),

    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [string]$ManualFixReportPath = (Join-Path -Path $PSScriptRoot -ChildPath ("fhir-manual-fixes-{0}.txt" -f (Get-Date -Format "yyyyMMdd-HHmmss")))
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function ConvertTo-PlainText {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [Security.SecureString]$SecureValue
    )

    $ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureValue)
    try {
        return [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr)
    }
    finally {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr)
    }
}

function Get-OperationOutcomeSummary {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [object]$BodyObject,

        [Parameter(Mandatory = $false)]
        [string]$RawBody
    )

    if ($null -eq $BodyObject -and -not [string]::IsNullOrWhiteSpace($RawBody)) {
        try {
            $BodyObject = $RawBody | ConvertFrom-Json -ErrorAction Stop
        }
        catch {
            return [pscustomobject]@{
                ResourceType = $null
                Text         = $RawBody
                Issues       = @()
            }
        }
    }

    if ($null -eq $BodyObject) {
        return $null
    }

    $resourceType = $null
    if ($BodyObject.PSObject.Properties.Match('resourceType').Count -gt 0) {
        $resourceType = $BodyObject.resourceType
    }

    $issues = @()

    if ($BodyObject.PSObject.Properties.Match('issue').Count -gt 0 -and $BodyObject.issue) {
        foreach ($issue in @($BodyObject.issue)) {
            $issues += [pscustomobject]@{
                Severity    = if ($issue.PSObject.Properties.Match('severity').Count -gt 0) { $issue.severity } else { $null }
                Code        = if ($issue.PSObject.Properties.Match('code').Count -gt 0) { $issue.code } else { $null }
                Diagnostics = if ($issue.PSObject.Properties.Match('diagnostics').Count -gt 0) { $issue.diagnostics } else { $null }
                Details     = if ($issue.PSObject.Properties.Match('details').Count -gt 0 -and $null -ne $issue.details -and $issue.details.PSObject.Properties.Match('text').Count -gt 0) { $issue.details.text } else { $null }
            }
        }
    }

    $textDiv = $null
    if ($BodyObject.PSObject.Properties.Match('text').Count -gt 0 -and $null -ne $BodyObject.text -and $BodyObject.text.PSObject.Properties.Match('div').Count -gt 0) {
        $textDiv = $BodyObject.text.div
    }

    return [pscustomobject]@{
        ResourceType = $resourceType
        Text         = $textDiv
        Issues       = $issues
    }
}

function Send-FhirResource {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$ResourcePath,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$ServerUrl,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$User,

        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string]$Pass,

        [Parameter(Mandatory = $true)]
        [bool]$IsDryRun,

        [Parameter(Mandatory = $true)]
        [bool]$IsValidate,

        [Parameter(Mandatory = $true)]
        [bool]$UsePostWhenIdMissing
    )

    $now = Get-Date
    $resourceType = $null
    $resourceId = $null

    try {
        $content = Get-Content -Path $ResourcePath -Raw -Encoding UTF8
        $resource = $content | ConvertFrom-Json -ErrorAction Stop


        if ($resource.PSObject.Properties.Match('resourceType').Count -gt 0) {
            $resourceType = $resource.resourceType
        }
        if ($resource.PSObject.Properties.Match('id').Count -gt 0) {
            $resourceId = $resource.id
        }

        if (-not $resourceType) {
            Write-Host "  Missing resourceType in $ResourcePath" -ForegroundColor Red
            return [pscustomobject]@{
                Timestamp        = $now
                FilePath         = $ResourcePath
                ResourceType     = $resourceType
                ResourceId       = $resourceId
                Action           = 'Validation'
                Success          = $false
                HttpStatus       = $null
                Message          = 'Missing resourceType'
                OperationOutcome = $null
            }
        }

        if ($IsValidate) {
            Write-Host "  Valid JSON: $ResourcePath" -ForegroundColor Green
            return [pscustomobject]@{
                Timestamp        = $now
                FilePath         = $ResourcePath
                ResourceType     = $resourceType
                ResourceId       = $resourceId
                Action           = 'Validate'
                Success          = $true
                HttpStatus       = $null
                Message          = 'Valid JSON'
                OperationOutcome = $null
            }
        }

        if ($IsDryRun) {
            $target = if ($resourceId) { "$resourceType/$resourceId" } else { "$resourceType (POST)" }
            Write-Host "  Would upload: $target" -ForegroundColor Yellow
            return [pscustomobject]@{
                Timestamp        = $now
                FilePath         = $ResourcePath
                ResourceType     = $resourceType
                ResourceId       = $resourceId
                Action           = 'DryRun'
                Success          = $true
                HttpStatus       = $null
                Message          = 'Dry run only'
                OperationOutcome = $null
            }
        }

        $pair = "${User}:${Pass}"
        $bytes = [Text.Encoding]::ASCII.GetBytes($pair)
        $base64 = [Convert]::ToBase64String($bytes)

        $headers = @{
            Authorization = "Basic $base64"
            Accept        = 'application/fhir+json'
        }

        $bundleType = $null
        if ($resourceType -eq 'Bundle' -and $resource.PSObject.Properties.Match('type').Count -gt 0 -and $resource.type) {
            $bundleType = $resource.type.ToString().ToLowerInvariant()
        }

        $method = 'Put'
        $url = "$ServerUrl/$resourceType/$resourceId"
        $action = 'Upload'
        $message = 'Uploaded'
        $httpStatus = 200

        # FHIR transaction/batch bundles must be posted to the base URL.
        if ($resourceType -eq 'Bundle' -and ($bundleType -eq 'transaction' -or $bundleType -eq 'batch')) {
            $method = 'Post'
            $url = "{0}/" -f $ServerUrl.TrimEnd('/')
            $action = 'UploadBundleOperation'
            $message = "Uploaded $bundleType bundle to base endpoint"
            $httpStatus = 200
        }
        elseif (-not $resourceId) {
            if ($UsePostWhenIdMissing) {
                $method = 'Post'
                $url = "$ServerUrl/$resourceType"
                $action = 'UploadPost'
                $message = 'Uploaded with POST (id missing)'
                $httpStatus = 201
            }
            else {
                Write-Host "  Missing id in $ResourcePath (use -PostWhenIdMissing to POST)" -ForegroundColor Red
                return [pscustomobject]@{
                    Timestamp        = $now
                    FilePath         = $ResourcePath
                    ResourceType     = $resourceType
                    ResourceId       = $resourceId
                    Action           = 'Validation'
                    Success          = $false
                    HttpStatus       = $null
                    Message          = 'Missing id'
                    OperationOutcome = $null
                }
            }
        }

        Write-Host "  Request: $method $url" -ForegroundColor DarkGray
        $response = Invoke-RestMethod -Uri $url -Method $method -Body $content -Headers $headers -ContentType 'application/fhir+json; charset=utf-8' -ErrorAction Stop
        $operationOutcome = Get-OperationOutcomeSummary -BodyObject $response

        $uploadedTarget = if ($resourceId) { "$resourceType/$resourceId" } else { "$resourceType (POST)" }
        Write-Host "  Uploaded: $uploadedTarget" -ForegroundColor Green

        return [pscustomobject]@{
            Timestamp        = $now
            FilePath         = $ResourcePath
            ResourceType     = $resourceType
            ResourceId       = $resourceId
            Action           = $action
            Success          = $true
            HttpStatus       = $httpStatus
            Message          = $message
            OperationOutcome = $operationOutcome
        }
    }
    catch {
        $httpStatus = $null
        $rawBody = $null
        $response = $null
        $exception = $_.Exception

        if ($null -ne $exception -and $exception.PSObject.Properties.Match('Response').Count -gt 0) {
            $response = $exception.Response
        }

        if ($null -ne $response) {
            try {
                if ($response.PSObject.Properties.Match('StatusCode').Count -gt 0) {
                    $httpStatus = [int]$response.StatusCode
                }
            }
            catch {
                $httpStatus = $null
            }

            try {
                if ($response.PSObject.Methods.Match('GetResponseStream').Count -gt 0) {
                    $stream = $response.GetResponseStream()
                    if ($null -ne $stream) {
                        $reader = New-Object IO.StreamReader($stream)
                        try {
                            $rawBody = $reader.ReadToEnd()
                        }
                        finally {
                            $reader.Close()
                            $stream.Close()
                        }
                    }
                }
                elseif ($response.PSObject.Properties.Match('Content').Count -gt 0 -and $null -ne $response.Content) {
                    $rawBody = $response.Content.ReadAsStringAsync().GetAwaiter().GetResult()
                }
            }
            catch {
                $rawBody = $null
            }
        }

        if ([string]::IsNullOrWhiteSpace($rawBody) -and $_.PSObject.Properties.Match('ErrorDetails').Count -gt 0 -and $null -ne $_.ErrorDetails) {
            $rawBody = $_.ErrorDetails.Message
        }

        $operationOutcome = Get-OperationOutcomeSummary -RawBody $rawBody
        $errorMessage = if ($null -ne $exception -and -not [string]::IsNullOrWhiteSpace($exception.Message)) { $exception.Message } else { 'Unknown error' }

        Write-Host "  Failed: $ResourcePath - $errorMessage" -ForegroundColor Red

        return [pscustomobject]@{
            Timestamp        = $now
            FilePath         = $ResourcePath
            ResourceType     = $resourceType
            ResourceId       = $resourceId
            Action           = 'Upload'
            Success          = $false
            HttpStatus       = $httpStatus
            Message          = $errorMessage
            OperationOutcome = $operationOutcome
        }
    }
}

function Get-ResourceIndex {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [System.Collections.IEnumerable]$Files
    )

    $index = @{}

    foreach ($file in $Files) {
        try {
            $raw = Get-Content -Path $file.FullName -Raw -Encoding UTF8
            $resource = $raw | ConvertFrom-Json -ErrorAction Stop

            $resourceType = $null
            $resourceId = $null

            if ($resource.PSObject.Properties.Match('resourceType').Count -gt 0) {
                $resourceType = $resource.resourceType
            }
            if ($resource.PSObject.Properties.Match('id').Count -gt 0) {
                $resourceId = $resource.id
            }

            if ([string]::IsNullOrWhiteSpace($resourceType) -or [string]::IsNullOrWhiteSpace($resourceId)) {
                continue
            }

            if (-not $index.ContainsKey($resourceType)) {
                $index[$resourceType] = New-Object System.Collections.Generic.List[string]
            }

            $index[$resourceType].Add($resourceId)
        }
        catch {
            continue
        }
    }

    return $index
}

function Get-ManualFixRecommendations {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [System.Collections.IEnumerable]$Outcomes,

        [Parameter(Mandatory = $false)]
        [hashtable]$ResourceIndex
    )

    $recommendations = New-Object System.Collections.Generic.List[object]
    $seen = New-Object System.Collections.Generic.HashSet[string]

    foreach ($entry in $Outcomes) {
        if ($entry.Success -or -not $entry.OperationOutcome -or -not $entry.OperationOutcome.Issues) {
            continue
        }

        foreach ($issue in @($entry.OperationOutcome.Issues)) {
            $diag = $issue.Diagnostics
            if ([string]::IsNullOrWhiteSpace($diag)) {
                continue
            }

            if ($diag -match 'HAPI-0960: Can not create resource with ID\[(?<id>[^\]]+)\]') {
                $key = "$($entry.FilePath)|NUMERIC_ID|$($matches['id'])"
                if (-not $seen.Add($key)) {
                    continue
                }

                $recommendations.Add([pscustomobject]@{
                    FilePath    = $entry.FilePath
                    Issue       = 'Numeric resource id not allowed by server'
                    Diagnostic  = $diag
                    Suggestion  = "Change id '$($matches['id'])' to contain at least one non-numeric character (example: '<Type>-$($matches['id'])') and update all references to it."
                })
                continue
            }

            if ($diag -match 'HAPI-1094: Resource (?<rtype>[^/]+)/(?<rid>[^ ]+) not found, specified in path: (?<path>.+)$') {
                $missingType = $matches['rtype']
                $missingId = $matches['rid']
                $fieldPath = $matches['path']

                $suggestion = "Update reference '$missingType/$missingId' in path '$fieldPath' to an existing resource id."

                if ($ResourceIndex -and $ResourceIndex.ContainsKey($missingType)) {
                    $candidates = @($ResourceIndex[$missingType] | Where-Object {
                        $_ -like "$missingId*" -or $_ -like "*$missingId*"
                    } | Select-Object -Unique)

                    if ($candidates.Count -eq 1) {
                        $suggestion = "Update reference '$missingType/$missingId' to '$missingType/$($candidates[0])' in path '$fieldPath'."
                    }
                    elseif ($candidates.Count -gt 1) {
                        $suggestion = "Update reference '$missingType/$missingId' in path '$fieldPath'. Candidate ids in package: $($candidates -join ', ')."
                    }
                }

                $key = "$($entry.FilePath)|MISSING_REF|$missingType|$missingId|$fieldPath"
                if (-not $seen.Add($key)) {
                    continue
                }

                $recommendations.Add([pscustomobject]@{
                    FilePath    = $entry.FilePath
                    Issue       = 'Missing referenced resource'
                    Diagnostic  = $diag
                    Suggestion  = $suggestion
                })
            }
        }
    }

    return $recommendations
}

function Test-IsRetryableMissingReference {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [object]$Outcome
    )

    if ($Outcome.Success -or -not $Outcome.OperationOutcome -or -not $Outcome.OperationOutcome.Issues) {
        return $false
    }

    foreach ($issue in @($Outcome.OperationOutcome.Issues)) {
        if (-not [string]::IsNullOrWhiteSpace($issue.Diagnostics) -and $issue.Diagnostics -match 'HAPI-1094: Resource .+ not found') {
            return $true
        }
    }

    return $false
}

if ([string]::IsNullOrWhiteSpace($FilePath) -and [string]::IsNullOrWhiteSpace($FolderPath)) {
    Write-Error 'Must specify -FilePath or -FolderPath'
    exit 1
}

if (-not [string]::IsNullOrWhiteSpace($FilePath) -and -not [string]::IsNullOrWhiteSpace($FolderPath)) {
    Write-Error 'Use either -FilePath or -FolderPath, not both'
    exit 1
}

if (-not $Credential -and -not $DryRun.IsPresent -and -not $Validate.IsPresent) {
    $securePassword = Read-Host -Prompt "Password for user '$Username'" -AsSecureString
    $Credential = New-Object System.Management.Automation.PSCredential($Username, $securePassword)
}

if ($Credential) {
    $Username = $Credential.UserName
    $Password = ConvertTo-PlainText -SecureValue $Credential.Password
}
else {
    $Password = ''
}

$outcomes = New-Object System.Collections.Generic.List[object]
$resourceIndex = $null

Write-Host 'FHIR Resource Upload' -ForegroundColor Cyan
Write-Host "Server: $FhirServerUrl" -ForegroundColor Gray
Write-Host "Include examples: $($IncludeExamples.IsPresent)" -ForegroundColor Gray
Write-Host "POST when id missing: $($PostWhenIdMissing.IsPresent)" -ForegroundColor Gray

if ($DryRun) {
    Write-Host 'Mode: DRY RUN' -ForegroundColor Yellow
}
elseif ($Validate) {
    Write-Host 'Mode: VALIDATE ONLY' -ForegroundColor Yellow
}
else {
    Write-Host 'Mode: UPLOAD' -ForegroundColor Green
}

Write-Host ''

if ($FilePath) {
    if (-not (Test-Path -Path $FilePath)) {
        Write-Error "File not found: $FilePath"
        exit 1
    }

    Write-Host "Processing file: $FilePath"
    $fileName = [IO.Path]::GetFileName($FilePath)
    if ($fileName -ieq '.index.json' -or $fileName -ieq 'package.json') {
        Write-Host "Skipping non-resource file: $FilePath" -ForegroundColor Yellow
    }
    elseif (-not $IncludeExamples.IsPresent -and $FilePath -match '[\\/]+examples[\\/]+') {
        Write-Host "Skipping example file (use -IncludeExamples): $FilePath" -ForegroundColor Yellow
    }
    else {
        $outcomes.Add((Send-FhirResource -ResourcePath $FilePath -ServerUrl $FhirServerUrl -User $Username -Pass $Password -IsDryRun $DryRun.IsPresent -IsValidate $Validate.IsPresent -UsePostWhenIdMissing $PostWhenIdMissing.IsPresent))
    }
}
else {
    if (-not (Test-Path -Path $FolderPath)) {
        Write-Error "Folder not found: $FolderPath"
        exit 1
    }

    Write-Host "Processing folder: $FolderPath"
    $files = Get-ChildItem -Path $FolderPath -Filter '*.json' -Recurse -File | Where-Object {
        $_.Name -ine '.index.json' -and
        $_.Name -ine 'package.json' -and
        ($IncludeExamples.IsPresent -or $_.FullName -notmatch '[\\/]+examples[\\/]+')
    }

    $resourceIndex = Get-ResourceIndex -Files $files

    Write-Host "Found $($files.Count) JSON files" -ForegroundColor Gray
    Write-Host ''

    $maxPasses = if ($IncludeExamples.IsPresent -and -not $DryRun.IsPresent -and -not $Validate.IsPresent) { 5 } else { 1 }
    $pendingFiles = @($files)

    for ($pass = 1; $pass -le $maxPasses -and $pendingFiles.Count -gt 0; $pass++) {
        if ($maxPasses -gt 1) {
            Write-Host "Upload pass $pass/$maxPasses (remaining: $($pendingFiles.Count))" -ForegroundColor DarkCyan
        }

        $nextPending = @()
        $passSucceeded = 0

        foreach ($file in $pendingFiles) {
            $result = Send-FhirResource -ResourcePath $file.FullName -ServerUrl $FhirServerUrl -User $Username -Pass $Password -IsDryRun $DryRun.IsPresent -IsValidate $Validate.IsPresent -UsePostWhenIdMissing $PostWhenIdMissing.IsPresent

            if ($maxPasses -gt 1 -and -not $result.Success -and (Test-IsRetryableMissingReference -Outcome $result) -and $pass -lt $maxPasses) {
                $nextPending += $file
                continue
            }

            if ($result.Success) {
                $passSucceeded++
            }

            $outcomes.Add($result)
        }

        if (@($nextPending).Count -gt 0 -and $passSucceeded -eq 0) {
            foreach ($file in $nextPending) {
                $result = Send-FhirResource -ResourcePath $file.FullName -ServerUrl $FhirServerUrl -User $Username -Pass $Password -IsDryRun $DryRun.IsPresent -IsValidate $Validate.IsPresent -UsePostWhenIdMissing $PostWhenIdMissing.IsPresent
                $outcomes.Add($result)
            }
            $pendingFiles = @()
            break
        }

        $pendingFiles = @($nextPending)
    }
}

$success = @($outcomes | Where-Object { $_.Success }).Count
$failed = @($outcomes | Where-Object { -not $_.Success }).Count

$outcomes | ConvertTo-Json -Depth 8 | Set-Content -Path $OutcomeReportPath -Encoding UTF8

$manualFixes = @(Get-ManualFixRecommendations -Outcomes $outcomes -ResourceIndex $resourceIndex)
if (@($manualFixes).Count -gt 0) {
    $manualFixLines = New-Object System.Collections.Generic.List[string]
    $manualFixLines.Add("Manual changes required before upload can fully succeed")
    $manualFixLines.Add("Generated: $(Get-Date -Format s)")
    $manualFixLines.Add('')

    $index = 1
    foreach ($fix in $manualFixes) {
        $manualFixLines.Add("$index. File: $($fix.FilePath)")
        $manualFixLines.Add("   Issue: $($fix.Issue)")
        $manualFixLines.Add("   Suggestion: $($fix.Suggestion)")
        $manualFixLines.Add("   Diagnostic: $($fix.Diagnostic)")
        $manualFixLines.Add('')
        $index++
    }

    $manualFixLines | Set-Content -Path $ManualFixReportPath -Encoding UTF8
}

Write-Host ''
Write-Host '========================================' -ForegroundColor Cyan
Write-Host 'Summary:' -ForegroundColor Cyan
Write-Host "  Success: $success" -ForegroundColor $(if ($success -gt 0) { 'Green' } else { 'Gray' })
Write-Host "  Failed: $failed" -ForegroundColor $(if ($failed -gt 0) { 'Red' } else { 'Gray' })
Write-Host "  Outcome report: $OutcomeReportPath" -ForegroundColor Gray
if (@($manualFixes).Count -gt 0) {
    Write-Host "  Manual fix report: $ManualFixReportPath" -ForegroundColor Yellow
}
Write-Host '========================================' -ForegroundColor Cyan

if ($failed -gt 0) {
    exit 1
}
