function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_05     --- MS Store Install ---                        ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] MSI Center"
    Write-Host "[2] MSI Driver App Center"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit" -ForegroundColor Red
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
   
# Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

    switch ($choice) {
        1 { Install-Or-Upgrade -id "9NVMNJCR03XV" } # MSI Center
        2 { Install-Or-Upgrade -id "9P9WDH947752" } # MSI Driver App Center
        0 {
            exit
            # Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1").Content
        }
        default { Write-Host "Invalid choice. Please try again." }
    }
}

# Main script loop
do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    Clear-Host
    Handle-Choice -choice $choice
    if ($choice -ne 0) { Start-Sleep -Seconds 2 }
} while ($choice -ne 0)
