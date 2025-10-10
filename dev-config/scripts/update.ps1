#!/usr/bin/env pwsh

Write-Host "Services update.." -ForegroundColor Green

Set-Location $PSScriptRoot/..

Write-Host "Update frontoffice.." -ForegroundColor Yellow
docker compose build --no-cache frontoffice

Write-Host "Update backoffice.." -ForegroundColor Yellow
docker compose build --no-cache backoffice

Write-Host "Data base migration.." -ForegroundColor Yellow
docker compose run --rm backoffice npm run strapi -- migrations:apply

Write-Host "Restart services.." -ForegroundColor Yellow
docker compose up -d

Write-Host "Update complete" -ForegroundColor Green