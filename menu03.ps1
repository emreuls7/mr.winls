function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_03     --- Winget 2 Install ---                        ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] CPUID CPU-Z MSI"
    Write-Host "[2] MSI Afterburner"
    Write-Host "[3] ASUS ArmouryCrate"
    Write-Host "[4] CPUID ROG CPU-Z"
    Write-Host "[5] Wireshark"
    Write-Host "[6] Keeper Password Manager"
    Write-Host "[7] NVIDIA GeForce NOW"
    Write-Host "[8] NVIDIA PhysX System Software"
    Write-Host "[9] NVIDIA Broadcast"
    Write-Host "[10] NVIDIA CUDA Toolkit"
    Write-Host "[11] spacedesk Windows DRIVER"
    Write-Host "[12] spacedesk Windows VIEWER"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit                                                           " -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
}

function Install-Software {
    param (
        [string]$choice
    )

    switch ($choice) {
        "1" { winget install CPUID.CPU-Z.MSI -e }
        "2" { winget install Guru3D.Afterburner -e }
        "3" { winget install Asus.ArmouryCrate }
        "4" { winget install CPUID.CPU-Z.ROG }
        "5" { winget install WiresharkFoundation.Wireshark -e }
        "6" { winget install Keeper.KeeperDesktop -e }
        "7" { winget install Nvidia.GeForceNow -e }
        "8" { winget install Nvidia.PhysX -e }
        "9" { winget install Nvidia.Broadcast -e }
        "10" { winget install Nvidia.CUDA -e }
        "11" { winget install Datronicsoft.SpacedeskDriver.Server -e }
        "12" { winget install Datronicsoft.SpacedeskDriver.Client -e }
        "0" { exit }
        default { Write-Host "Invalid choice. Please enter a number between 0 and 12." }
    }
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    Install-Software -choice $choice
} while ($choice -ne "0")

