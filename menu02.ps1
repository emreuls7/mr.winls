function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_02     --- Winget 1 Install ---                        ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1]  TechPowerUp GPU-Z"
    Write-Host "[2]  Crystal Disk Info"
    Write-Host "[3]  Crystal Disk Mark"
    Write-Host "[4]  Core Temp"
    Write-Host "[5]  Lightshot"
    Write-Host "[6]  Winget UI"
    Write-Host "[7]  Java 8"
    Write-Host "[8]  DisplayFusion"
    Write-Host "[9]  Malwarebytes"
    Write-Host "[10] Telerik Fiddler Classic"
    Write-Host "[11] Termius"
    Write-Host "[12] GlassWire"
    Write-Host "[13] inZip"
    Write-Host "[14] Notion"
    Write-Host "[15] FL Studio"
    Write-Host "[16] NDI 6 Tools"
    Write-Host "[17] NDI 6 Runtime"
    Write-Host "[18] Python"
    Write-Host "[19] Node.js"
    Write-Host "[20] Unity"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit                                                           "  -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
}

function Install-Application {
    param (
        [int]$choice
    )
    switch ($choice) {
        1 { winget install TechPowerUp.GPU-Z -e }
        2 { winget install CrystalDewWorld.CrystalDiskInfo -e }
        3 { winget install CrystalDewWorld.CrystalDiskMark -e }
        4 { winget install ALCPU.CoreTemp -e }
        5 { winget install Skillbrains.Lightshot -e }
        6 { winget install SomePythonThings.WingetUIStore -e }
        7 { winget install Oracle.JavaRuntimeEnvironment -e }
        8 { winget install BinaryFortress.DisplayFusion -e }
        9 { winget install Malwarebytes.Malwarebytes -e }
        10 { winget install Telerik.Fiddler.Classic -e }
        11 { winget install Termius.Termius -e }
        12 { winget install GlassWire.GlassWire -e }
        13 { winget install Corel.WinZip -e }
        14 { winget install Notion.Notion -e }
        15 { winget install ImageLine.FLStudio -e }
        16 { winget install NDI.NDITools -e }
        17 { winget install NDI.NDIRuntime -e }
        18 { winget install Python.Launcher -e }
        19 { winget install OpenJS.NodeJS -e }
        20 { winget install Unity.Unity.2020 -e }
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
