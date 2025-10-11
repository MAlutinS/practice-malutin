#!/usr/bin/env pwsh

param(
    [string]$ServiceName = ""
)

Set-Location $PSScriptRoot/..

if (-not $ServiceName) {
    Write-Host "Input service name: .\scripts\console.ps1 <service_name>" -ForegroundColor Red
    Write-Host "Access services: frontoffice, backoffice, db, balancer" -ForegroundColor Yellow
    exit 1
}

Write-Host "Connect to service: $ServiceName" -ForegroundColor Green

switch ($ServiceName) {
    "db" { docker compose exec db psql -U admin backoffice }
    "pgadmin" { docker compose exec pgadmin sh }  
    default { docker compose exec $ServiceName sh }
}