function Show-Menu {
    cls
    Write-Host "--------------------------------------------------------------"
    Write-Host "--- menu_07 --- VPN + Remote Install ---                   ---" -ForegroundColor Red
    Write-Host "--------------------------------------------------------------"
    Write-Host "[1]  FortiClient VPN"
    Write-Host "[2]  Windscribe VPN"
    Write-Host "[3]  ExpressVPN"
    Write-Host "[4]  NordVPN"
    Write-Host "[5]  ProtonVPN"
    Write-Host "[6]  Radmin VPN"
    Write-Host "[7]  OpenVPN"
    Write-Host "[8]  OpenVPN Connect"
    Write-Host "[9]  WireGuard VPN"
    Write-Host "[10] Mullvad VPN"
    Write-Host "[11] UltraVNC"
    Write-Host "[12] RealVNC Viewer"
    Write-Host "[13] RealVNC Server"
    Write-Host "[14] AnyDesk"
    Write-Host "[15] TeamViewer"
    Write-Host "[16] Chrome Remote Desktop Host"
    Write-Host "--------------------------------------------------------------"
    Write-Host "[21] mRemoteNG"
    Write-Host "[22] 1Remote"
    Write-Host "--------------------------------------------------------------"
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "--------------------------------------------------------------"
}

function Install-Software {
    param (
        [string]$id
    )
    
    winget install --id $id -e --accept-package-agreements --accept-source-agreements --silent
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    switch ($choice) {
        "1" { Install-Software -id "Fortinet.FortiClientVPN" }
        "2" { Install-Software -id "Windscribe.Windscribe" }
        "3" { Install-Software -id "ExpressVPN.ExpressVPN" }
        "4" { Install-Software -id "NordVPN.NordVPN" }
        "5" { Install-Software -id "ProtonTechnologies.ProtonVPN" }
        "6" { Install-Software -id "Radmin.VPN" }
        "7" { Install-Software -id "OpenVPNTechnologies.OpenVPN" }
        "8" { Install-Software -id "OpenVPNTechnologies.OpenVPNConnect" }
        "9" { Install-Software -id "WireGuard.WireGuard" }
        "10" { Install-Software -id "MullvadVPN.MullvadVPN" }
        "11" { Install-Software -id "uvncbvba.UltraVnc" }
        "12" { Install-Software -id "RealVNC.VNCViewer" }
        "13" { Install-Software -id "RealVNC.VNCServer" }
        "14" { Install-Software -id "AnyDeskSoftwareGmbH.AnyDesk" }
        "15" { Install-Software -id "TeamViewer.TeamViewer" }
        "16" { Install-Software -id "Google.ChromeRemoteDesktopHost" }
        "21" { Install-Software -id "mRemoteNG.mRemoteNG" }
        "22" { Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "winget install --id 9PNMNF92JNFP --accept-package-agreements --accept-source-agreements --silent"' -Wait }
        "0" { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1").Content }
        default { Write-Host "Invalid choice. Please enter a number between 0 and 22." }
    }
} while ($choice -ne "0")

