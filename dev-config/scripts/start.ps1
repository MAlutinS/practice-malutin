#!/usr/bin/env pwsh

Write-Host "Turn of services"

Set-Location $PSScriptRoot/..

docker compose up -d

Write-Host "Services on" -ForegroundColor Green
Write-Host "Services status:"

docker compose ps 