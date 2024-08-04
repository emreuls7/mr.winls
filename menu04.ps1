function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_04       --- Choco Install ---                         ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] FileZilla Server"
    Write-Host "[2] UniFi Network Application"
    Write-Host "[3] qBittorrent"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit                                                           " -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
}

# Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

    switch ($choice) {
        1 { choco install filezilla.server -y }
        2 { choco install ubiquiti-unifi-controller -y }
        3 { choco install qbittorrent -y }
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

