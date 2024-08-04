function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_10  --- Games Lounge Installer ---                     ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] Steam"
    Write-Host "[2] Epic Games Launcher"
    Write-Host "[3] EA app"
    Write-Host "[4] Ubisoft Connect"
    Write-Host "[5] GOG GALAXY"
    Write-Host "[6] Rockstar Games Launcher"
    Write-Host "[7] Amazon Games"
    Write-Host "[8] Google Play Games Beta"
    Write-Host "[9] Blitz"
    Write-Host "===================================================================="
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "===================================================================="
}

function Install-Software {
    param (
        [string]$id
    )
    winget install --id $id -e --accept-package-agreements --accept-source-agreements --silent
}

# Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

    switch ($choice) {
        "1" { Install-Software -id "Valve.Steam" }
        "2" { Install-Software -id "EpicGames.EpicGamesLauncher" }
        "3" { Install-Software -id "ElectronicArts.EADesktop" }
        "4" { Install-Software -id "Ubisoft.Connect" }
        "5" { Install-Software -id "GOG.Galaxy" }
        "6" { Start-Process choco -ArgumentList "install rockstar-launcher -y" -Wait }
        "7" { Install-Software -id "Amazon.Games" }
        "8" { Install-Software -id "Google.PlayGames.Beta" }
        "9" { Install-Software -id "Blitz.Blitz" }
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

