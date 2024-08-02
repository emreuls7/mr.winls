function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_11 --- Microsoft Program Install ---                   ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1]  Microsoft OneNote Store"
    Write-Host "[2]  Microsoft PC Manager"
    Write-Host "[3]  Microsoft OneDrive"
    Write-Host "[4]  Microsoft Teams"
    Write-Host "[5]  Microsoft PowerToys"
    Write-Host "[6]  Microsoft DirectX"
    Write-Host "[7]  Microsoft VCRedist 2005-2015+"
    Write-Host "[8]  Microsoft Dot Net Framework 3-4+"
    Write-Host "[9]  Grammarly for Windows"
    Write-Host "[10] Microsoft Remote Desktop Store"
    Write-Host "[11] Microsoft 365 Apps for enterprise"
    Write-Host "[12] Windows Scan"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
}

function Install-Software {
    param (
        [string]$id
    )
    winget install --id $id -e --accept-package-agreements --accept-source-agreements --silent
}

function Install-ChocoSoftware {
    param (
        [string[]]$packages
    )
    foreach ($package in $packages) {
        Start-Process choco -ArgumentList "install $package -y" -Wait
    }
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    switch ($choice) {
        "1" { Install-Software -id "XPFFZHVGQWWLHB" }
        "2" { Install-Software -id "Microsoft.PCManager" }
        "3" { Install-Software -id "Microsoft.OneDrive" }
        "4" { Install-Software -id "Microsoft.Teams" }
        "5" { Install-Software -id "Microsoft.PowerToys" }
        "6" { Install-Software -id "Microsoft.DirectX" }
        "7" {
            $vcPackages = @(
                "Microsoft.VCRedist.2005.x86",
                "Microsoft.VCRedist.2005.x64",
                "Microsoft.VCRedist.2008.x86",
                "Microsoft.VCRedist.2008.x64",
                "Microsoft.VCRedist.2010.x86",
                "Microsoft.VCRedist.2010.x64",
                "Microsoft.VCRedist.2012.x86",
                "Microsoft.VCRedist.2012.x64",
                "Microsoft.VCRedist.2013.x86",
                "Microsoft.VCRedist.2013.x64",
                "Microsoft.VCRedist.2015+.x86",
                "Microsoft.VCRedist.2015+.x64"
            )
            Install-Software -id $vcPackages
        }
        "8" {
            $dotnetPackages = @(
                "dotnet3.5",
                "dotnet4.5.1",
                "dotnet4.5.2"
            )
            Install-ChocoSoftware -packages $dotnetPackages
        }
        "9" { Install-Software -id "Grammarly.Grammarly" }
        "10" { Install-Software -id "9WZDNCRFJ3PS" }
        "11" { Install-Software -id "Microsoft.Office" }
        "12" { Install-Software -id "9WZDNCRFJ3PV" }
        "0" { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1").Content }
        default { Write-Host "Invalid choice. Please enter a number between 0 and 12." }
    }
} while ($choice -ne "0")

