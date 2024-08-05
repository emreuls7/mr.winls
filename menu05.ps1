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
 
# Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

    switch ($choice) {
        1 { winget install -id 9NVMNJCR03XV -e --accept-package-agreements --accept-source-agreements --silent } # MSI Center
        2 { winget install -id 9P9WDH947752 -e --accept-package-agreements --accept-source-agreements --silent } # MSI Driver App Center
        0 {
            exit
        }
        default { Write-Host "Invalid choice. Please try again." }
    }
}

# Main loop
do {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    Handle-Choice -choice $choice
} while ($choice -ne 0)
