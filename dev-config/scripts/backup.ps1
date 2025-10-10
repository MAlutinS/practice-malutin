#!/usr/bin/env pwsh

param(
    [string]$BackupName = "backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
)

Set-Location $PSScriptRoot/..

$BackupDir = "scripts/backup/$BackupName"
New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null

Write-Host "Creating reserve copy: $BackupName" -ForegroundColor Green

Write-Host "Reserve data base copy..." -ForegroundColor Yellow
docker compose exec -T db pg_dump -U admin backoffice > "$BackupDir/database_backup.sql"

Write-Host "Reserve cfg copy..." -ForegroundColor Yellow

$BackofficeBackupDir = "$BackupDir/backoffice_config"
New-Item -ItemType Directory -Force -Path $BackofficeBackupDir | Out-Null
if (Test-Path "..\backoffice\config") {
    Copy-Item -Path "..\backoffice\config\*" -Destination $BackofficeBackupDir -Recurse -Force
}

$FrontofficeBackupDir = "$BackupDir/frontoffice"
New-Item -ItemType Directory -Force -Path $FrontofficeBackupDir | Out-Null
if (Test-Path "..\frontoffice") {
    Copy-Item -Path "..\frontoffice\package.json" -Destination $FrontofficeBackupDir -Force -ErrorAction SilentlyContinue
    Copy-Item -Path "..\frontoffice\src\*" -Destination "$FrontofficeBackupDir\src" -Recurse -Force -ErrorAction SilentlyContinue
    Copy-Item -Path "..\frontoffice\public\*" -Destination "$FrontofficeBackupDir\public" -Recurse -Force -ErrorAction SilentlyContinue
    Copy-Item -Path "..\frontoffice\astro.config.mjs" -Destination $FrontofficeBackupDir -Force -ErrorAction SilentlyContinue
}

$DevConfigBackupDir = "$BackupDir/dev-config"
New-Item -ItemType Directory -Force -Path $DevConfigBackupDir | Out-Null
Copy-Item -Path ".\docker-compose.yml" -Destination $DevConfigBackupDir -Force
Copy-Item -Path "\.env" -Destination $DevConfigBackupDir -Force -ErrorAction SilentlyContinue
Copy-Item -Path ".\Dockerfile.*" -Destination $DevConfigBackupDir -Force -ErrorAction SilentlyContinue
Copy-Item -Path ".\balancer\*" -Destination "$DevConfigBackupDir\balancer" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Archive creating..." -ForegroundColor Yellow
Compress-Archive -Path "$BackupDir\*" -DestinationPath "scripts/backup/$BackupName.zip" -Force

Remove-Item -Path $BackupDir -Recurse -Force

Write-Host "Reserve copy created: scripts/backup/$BackupName.zip" -ForegroundColor Green