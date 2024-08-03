# PowerShell Script for Protel MC + Fidelio Install

function Show-Menu {
    cls
    Write-Host "------------------------------------------------"
    Write-Host "--- Welcome Protel MC + Fidelio Install      ---"
    Write-Host "------------------------------------------------"
    Write-Host "[1] Windows Credentials 192.168.18.8 add"
    Write-Host "[2] Oracle Setup + Admin Copy"
    Write-Host "[3] MC Setup ( Materials Control )"
    Write-Host "[4] Fidelio Setup"
    Write-Host "[5] Fidelio V8 Client Short Cut Setup"
    Write-Host "[6] IFC Setup"
    Write-Host "------------------------------------------------"
    Write-Host "[0] Exit"
    Write-Host "------------------------------------------------"
}

function Add-WindowsCredentials {
    cls
    Write-Host "------------------------------------------------"
    cmdkey /add:192.168.18.8 /user:it /pass:C3kss181
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to add credentials."
        Read-Host "Press Enter to continue"
    }
}

function Run-Setup {
    param (
        [string]$setupPath
    )
    if (Test-Path $setupPath) {
        Start-Process $setupPath -Wait
    } else {
        Write-Host "Setup file not found: $setupPath"
        Read-Host "Press Enter to continue"
    }
}

function Copy-Files {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )
    if (Test-Path $sourcePath) {
        robocopy $sourcePath $destinationPath /E /IS
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Failed to copy files from $sourcePath to $destinationPath."
            Read-Host "Press Enter to continue"
        }
    } else {
        Write-Host "Source path not found: $sourcePath"
        Read-Host "Press Enter to continue"
    }
}

function Grant-Permissions {
    param (
        [string]$path,
        [string]$permission
    )
    icacls $path /grant $permission
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to grant permissions on $path."
        Read-Host "Press Enter to continue"
    }
}

function Install-Fidelio {
    param (
        [string]$setupPath,
        [string]$copySource,
        [string]$copyDestination
    )
    Start-Process $setupPath -Wait
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Fidelio setup failed."
        Read-Host "Press Enter to continue"
        return
    }
    Copy-Files $copySource $copyDestination
}

Show-Menu
do {
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    switch ($choice) {
        '1' {
            Add-WindowsCredentials
        }
        '2' {
            cls
            Write-Host "------------------------------------------------"
            Write-Host "Starting Oracle setup..."
            Write-Host "------------------------------------------------"
            Run-Setup "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\1-Oracle - setup\client 11204\setup.exe"
            Write-Host "------------------------------------------------"
            Write-Host "Copying Oracle files..."
            Write-Host "------------------------------------------------"
            Copy-Files "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\2-Oracle Admin - copypast\Oracle" "C:\Oracle"
        }
        '3' {
            cls
            Write-Host "------------------------------------------------"
            Write-Host "Starting .NET Framework setup..."
            Write-Host "------------------------------------------------
