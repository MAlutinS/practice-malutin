#!/usr/bin/env pwsh

param(
    [string]$ServiceName = ""
)

Set-Location $PSScriptRoot/..

if (-not $ServiceName) {
    Write-Host "Imput service name: .\scripts\logs.ps1 <service_name>" -ForegroundColor Red
    Write-Host "Access serices: frontoffice, backoffice, db, balancer, pgadmin" -ForegroundColor Yellow
    exit 1
}

Write-Host "Service logs: $ServiceName" -ForegroundColor Green
docker compose logs -f $ServiceName