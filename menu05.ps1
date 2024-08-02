function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_05     --- MS Store Install ---                        ---"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] MSI Center"
    Write-Host "[2] MSI Driver App Center"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit"
    Write-Host "-------------------------------------------------------------------"
}

function Install-Or-Upgrade {
    param (
        [string]$id
    )
    
    $installed = winget list --id $id -e > $null 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Application already installed. Update in progress..."
        winget upgrade --id $id -e --accept-package-agreements --accept-source-agreements --silent
    } else {
        Write-Host "The application is not installed. Installing..."
        winget install --id $id -e --accept-package-agreements --accept-source-agreements --silent
    }
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2...)"
    switch ($choice) {
        "1" { Install-Or-Upgrade -id "9NVMNJCR03XV" } # MSI Center
        "2" { Install-Or-Upgrade -id "9P9WDH947752" } # MSI Driver App Center
        "0" { exit }
        default { Write-Host "Invalid choice. Please enter a number between 0 and 2." }
    }
} while ($choice -ne "0")

