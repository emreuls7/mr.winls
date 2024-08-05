function Show-Menu {
    Clear-Host
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_12 --- Microsoft .NET Installer ---                    ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1]  Microsoft Dot Net Framework 3.5"
    Write-Host "[2]  Microsoft Dot Net Framework 4.5.1"
    Write-Host "[3]  Microsoft Dot Net Framework 4.5.2"
    Write-Host "[4]  Microsoft Build of OpenJDK with Hotspot 11"
    Write-Host "[5]  Microsoft Build of OpenJDK with Hotspot 16"
    Write-Host "[6]  Microsoft Build of OpenJDK with Hotspot 17"
    Write-Host "[7]  Microsoft Build of OpenJDK with Hotspot 21"
    Write-Host "[8]  Microsoft Windows Desktop Runtime - 3 (x64)"
    Write-Host "[9]  Microsoft Windows Desktop Runtime - 3 (x86)"
    Write-Host "[10] Microsoft Windows Desktop Runtime - 5 (x64)"
    Write-Host "[11] Microsoft Windows Desktop Runtime - 5 (x86)"
    Write-Host "[12] Microsoft Windows Desktop Runtime - 6 (x64)"
    Write-Host "[13] Microsoft Windows Desktop Runtime - 6 (x86)"
    Write-Host "[14] Microsoft Visual C++ 2005 Redistributable (x86)"
    Write-Host "[15] Microsoft Visual C++ 2005 Redistributable (x64)"
    Write-Host "[16] Microsoft Visual C++ 2008 Redistributable (x86)"
    Write-Host "[17] Microsoft Visual C++ 2008 Redistributable (x64)"
    Write-Host "[18] Microsoft Visual C++ 2010 Redistributable (x86)"
    Write-Host "[19] Microsoft Visual C++ 2010 Redistributable (x64)"
    Write-Host "[20] Microsoft Visual C++ 2012 Redistributable (x86)"
    Write-Host "[21] Microsoft Visual C++ 2012 Redistributable (x64)"
    Write-Host "[22] Microsoft Visual C++ 2013 Redistributable (x86)"
    Write-Host "[23] Microsoft Visual C++ 2013 Redistributable (x64)"
    Write-Host "[24] Microsoft Visual C++ 2015+ Redistributable (x86)"
    Write-Host "[25] Microsoft Visual C++ 2015+ Redistributable (x64)"
    Write-Host "[26] Microsoft .NET Runtime 3.1"
    Write-Host "[27] Microsoft .NET Runtime 5.0"
    Write-Host "[28] Microsoft .NET Runtime 6.0"
    Write-Host "[29] Microsoft .NET Runtime 7.0"
    Write-Host "[30] Microsoft .NET Runtime 8.0"
    Write-Host "[31] Microsoft .NET Runtime 9.0 Preview"
    Write-Host "[32] Microsoft ASP.NET Core Hosting Bundle 3.1"
    Write-Host "[33] Microsoft ASP.NET Core Hosting Bundle 5.0"
    Write-Host "[34] Microsoft ASP.NET Core Hosting Bundle 6.0"
    Write-Host "[35] Microsoft ASP.NET Core Hosting Bundle 7.0"
    Write-Host "[36] Microsoft ASP.NET Core Hosting Bundle 8.0"
    Write-Host "[37] Microsoft ASP.NET Core Hosting Bundle 9.0 Preview"
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

# Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

    switch ($choice) {
        1 { Install-ChocoSoftware -packages @("dotnet3.5") }
        2 { Install-ChocoSoftware -packages @("dotnet4.5.1") }
        3 { Install-ChocoSoftware -packages @("dotnet4.5.2") }
        4 { Install-Software -id "Microsoft.OpenJDK.11" }
        5 { Install-Software -id "Microsoft.OpenJDK.16" }
        6 { Install-Software -id "Microsoft.OpenJDK.17" }
        7 { Install-Software -id "Microsoft.OpenJDK.21" }
        8 { Install-Software -id "Microsoft.dotnetRuntime.3-x64" }
        9 { Install-Software -id "Microsoft.dotnetRuntime.3-x86" }
        10 { Install-Software -id "Microsoft.dotnetRuntime.5-x64" }
        11 { Install-Software -id "Microsoft.dotnetRuntime.5-x86" }
        12 { Install-Software -id "Microsoft.dotnetRuntime.6-x64" }
        13 { Install-Software -id "Microsoft.dotnetRuntime.6-x86" }
        14 { Install-Software -id "Microsoft.VCRedist.2005.x86" }
        15 { Install-Software -id "Microsoft.VCRedist.2005.x64" }
        16 { Install-Software -id "Microsoft.VCRedist.2008.x86" }
        17 { Install-Software -id "Microsoft.VCRedist.2008.x64" }
        18 { Install-Software -id "Microsoft.VCRedist.2010.x86" }
        19 { Install-Software -id "Microsoft.VCRedist.2010.x64" }
        20 { Install-Software -id "Microsoft.VCRedist.2012.x86" }
        21 { Install-Software -id "Microsoft.VCRedist.2012.x64" }
        22 { Install-Software -id "Microsoft.VCRedist.2013.x86" }
        23 { Install-Software -id "Microsoft.VCRedist.2013.x64" }
        24 { Install-Software -id "Microsoft.VCRedist.2015+.x86" }
        25 { Install-Software -id "Microsoft.VCRedist.2015+.x64" }
        26 { Install-Software -id "Microsoft.DotNet.Runtime.3_1" }
        27 { Install-Software -id "Microsoft.DotNet.Runtime.5" }
        28 { Install-Software -id "Microsoft.DotNet.Runtime.6" }
        29 { Install-Software -id "Microsoft.DotNet.Runtime.7" }
        30 { Install-Software -id "Microsoft.DotNet.Runtime.8" }
        31 { Install-Software -id "Microsoft.DotNet.Runtime.Preview" }
        32 { Install-Software -id "Microsoft.DotNet.HostingBundle.3_1" }
        33 { Install-Software -id "Microsoft.DotNet.HostingBundle.5" }
        34 { Install-Software -id "Microsoft.DotNet.HostingBundle.6" }
        35 { Install-Software -id "Microsoft.DotNet.HostingBundle.7" }
        36 { Install-Software -id "Microsoft.DotNet.HostingBundle.8" }
        37 { Install-Software -id "Microsoft.DotNet.HostingBundle.Preview" }
        0 {
            # exit
            Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/microsoft_menu.ps1").Content
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

    # Pause for 2 seconds if the choice is not '0'
    #if ($choice -ne '0') { 
     #   Start-Sleep -Seconds 2 
    #}

    # Prompt the user to press Enter to continue
    Write-Host "`nPress Enter to continue..."
    Read-Host
} while ($choice -ne '0')
