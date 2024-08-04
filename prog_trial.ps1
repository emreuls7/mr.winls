function Show-Menu {
    Clear-Host
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "--- Main Menu                  --- Welcome to Software Install ---                                 CREATED BY MRLSx7 ---" -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[1] Program Install *                              [6]  Web Browser Install               "
    Write-Host "[2] Winget 1* Install                              [7]  VPN + Remote Install              "
    Write-Host "[3] Winget 2* Install                              [8]  Media Player Install              "
    Write-Host "[4] Choco Instal                                   [9]  Chat Messenger Install            "
    Write-Host "[5] MS Store Install                               [10] Gaming Launcher Install           "
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[11] Microsoft Windows Menu                        [15] *Standard PC Install              "                    
    Write-Host "[12] *Microsoft Windows Fixed                      [16] *Pasha Lefkosa Other              "
    Write-Host "[13] Setup Program Install ISO + EXE               [17] Winget Install *                  "
    Write-Host "[14] Setup Microsoft Office Install EXE            [18] Chocolatey Install *              "
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[98] Windows Utility (winutil)                     [99] Microsoft Activation Scripts (MAS)"
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[0] Exit                                                                                   " -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
}
function Download-And-Execute-Script {
    param (
        [string]$Url
    )
    
    $tempPath = [System.IO.Path]::Combine($env:TEMP, [System.IO.Path]::GetRandomFileName() + ".ps1")
    
    try {
        Write-Host "Downloading script from $Url..." -ForegroundColor Green
        Invoke-WebRequest -Uri $Url -OutFile $tempPath
        Write-Host "Script downloaded to $tempPath" -ForegroundColor Green
        
        Write-Host "Executing script..." -ForegroundColor Green
        Start-Process -FilePath "pwsh.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$tempPath`"" -Wait -NoNewWindow
    } catch {
        Write-Host "An error occurred while processing the script: $_" -ForegroundColor Red
    } finally {
        if (Test-Path $tempPath) {
            Remove-Item $tempPath -Force
            Write-Host "Temporary file removed." -ForegroundColor Green
        }
    }
}
function Handle-Choice {
    param (
        [int]$Choice
    )

    Clear-Host
    switch ($Choice) {
        1 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu01.ps1" }
        2 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu02.ps1" }
        3 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu03.ps1" }
        4 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu04.ps1" }
        5 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu05.ps1" }
        6 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu06.ps1" }
        7 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu07.ps1" }
        8 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu08.ps1" }
        9 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu09.ps1" }
        10 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu10.ps1" }
        11 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/win/microsoft_menu.ps1" }
        12 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/win/fix.ps1" }
        13 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/menu_iso.ps1" }
        14 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/win/menu_office.ps1" }
        15 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pc.ps1" }
        16 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pasha_menu.ps1" }
        17 { 
            Write-Host "*** Winget Install ***." -ForegroundColor Blue
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
            iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1'))
            winget upgrade --all
        }
        18 { 
            Write-Host "*** Chocolatey Install ***." -ForegroundColor Blue
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1'))
            choco upgrade chocolatey -y; choco upgrade all -y
        }
        98 { 
            Write-Host "You chose Windows Utility (winutil)." -ForegroundColor Cyan
            Download-And-Execute-Script "https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/winutil.ps1"
        }
        99 { 
            Write-Host "You chose Microsoft Activation Scripts (MAS)." -ForegroundColor Cyan
            Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1"
        }
        0 { 
            # Clear the screen
            Clear-Host

            # Display the exit message
            Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Cyan
            Write-Host "--- Exit                      --- Thank you for using Software Installer ---                       CREATED BY MRLSx7 ---" -ForegroundColor Red
            Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Cyan

            # Wait for 2 seconds
            Start-Sleep -Seconds 2

            # Exit the script
            exit
        }
        default { Write-Host "Invalid choice, please try again." -ForegroundColor Red }
    }
}
do {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    if ($choice -match '^\d+$') {
        $choice = [int]$choice
        Handle-Choice -Choice $choice
    } else {
        Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
    }
    if ($choice -ne 0) {
        Clear-Host
    }
} while ($choice -ne 0)
