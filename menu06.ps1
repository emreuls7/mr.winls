function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_06    --- Browser Install ---                          ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1]  Google Chrome"
    Write-Host "[2]  Google Chrome Dev"
    Write-Host "[3]  Mozilla Firefox"
    Write-Host "[4]  Mozilla Firefox Developer Edition"
    Write-Host "[5]  Brave"
    Write-Host "[6]  Brave Dev"
    Write-Host "[7]  Opera Stable"
    Write-Host "[8]  Opera GX Stable"
    Write-Host "[9]  Safari"
    Write-Host "[10] Tor Browser"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
}

function Install-Browser {
    param (
        [string]$id
    )

    winget install --id $id -e
}


  # Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

    switch ($choice) {
        1 { Install-Browser -id "Google.Chrome" }
        2 { Install-Browser -id "Google.Chrome.Dev" }
        3 { Install-Browser -id "Mozilla.Firefox" }
        4 { Install-Browser -id "Mozilla.Firefox.DeveloperEdition" }
        5 { Install-Browser -id "Brave.Brave" }
        6 { Install-Browser -id "Brave.Brave.Dev" }
        7 { Install-Browser -id "Opera.Opera" }
        8 { Install-Browser -id "Opera.OperaGX" }
        9 { Install-Browser -id "Apple.Safari" }
        10 { Install-Browser -id "TorProject.TorBrowser" }
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

