#!/usr/bin/env pwsh

Write-Host "Stopping all services.." -ForegroundColor Red

Set-Location $PSScriptRoot/..

docker compose stop

Write-Host "All services stopped" -ForegroundColor Green