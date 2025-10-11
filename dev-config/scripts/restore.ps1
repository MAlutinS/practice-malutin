#!/usr/bin/env pwsh

param(
    [string]$BackupFile = ""
)

Set-Location $PSScriptRoot/..

if (-not $BackupFile) {
    $LatestBackup = Get-ChildItem "scripts/backup/*.zip" | Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if (-not $LatestBackup) {
        Write-Host "Did not find reserve copy" -ForegroundColor Red
        exit 1
    }
    $BackupFile = $LatestBackup.Name
}

Write-Host "Restore from reserve copy: $BackupFile" -ForegroundColor Green

docker compose down

$RestoreDir = "scripts/restore_temp"
Remove-Item -Path $RestoreDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path $RestoreDir | Out-Null

Expand-Archive -Path "scripts/backup/$BackupFile" -DestinationPath $RestoreDir -Force

Write-Host "Restore data base.." -ForegroundColor Yellow
docker compose up -d db
Start-Sleep -Seconds 10
Get-Content "$RestoreDir/database_backup.sql" | docker compose exec -T db psql -U admin backoffice

Write-Host "Files restore.." -ForegroundColor Yellow
Copy-Item -Path "$RestoreDir\backoffice_config\*" -Destination "..\backoffice\config\" -Recurse -Force
Copy-Item -Path "$RestoreDir\frontoffice\*" -Destination "..\frontoffice\" -Recurse -Force
Copy-Item -Path "$RestoreDir\dev-config\*" -Destination ".\" -Recurse -Force

Remove-Item -Path $RestoreDir -Recurse -Force

docker compose up -d

Write-Host "Restore complete" -ForegroundColor Green