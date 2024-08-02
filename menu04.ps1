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

function Install-Software {
    param (
        [string]$choice
    )

    switch ($choice) {
        "1" { choco install filezilla.server -y }
        "2" { choco install ubiquiti-unifi-controller -y }
        "3" { choco install qbittorrent -y }
        "0" { exit }
        default { Write-Host "Invalid choice. Please enter a number between 0 and 3." }
    }
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    Install-Software -choice $choice
} while ($choice -ne "0")

