#!/usr/bin/env pwsh
$ErrorActionPreference ="Stop"
Push-Location
Set-Location example/examplea
Remove-Item .terraform -Recurse -ErrorAction SilentlyContinue
terraform init
terraform validate
make valid
Pop-Location
