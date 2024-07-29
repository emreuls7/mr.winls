# Menü görüntüleme fonksiyonu
function Show-Menu {
    Clear-Host
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "--- Main Menu                  --- Welcome to Software Install ---                                 CREATED BY MRLSx7 ---" -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[1]  ***-Program Install-***                       [6]  Browser Install                                                 " -ForegroundColor DarkGreen
    Write-Host "[2]  Program Install                               [7]  VPN + Remote Install                                            " -ForegroundColor DarkGreen
    Write-Host "[3]  Security Install                              [8]  Media Player Install                                            " -ForegroundColor DarkGreen
    Write-Host "[4]  Developer Tools Install                       [9]  Chat Messenger Install                                          " -ForegroundColor DarkGreen
    Write-Host "[5]  Driver Install                                [10] Games Launcher Install                                          " -ForegroundColor DarkGreen
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[11] Microsoft Program Install                     [21] * Windows Fixed *                                               " -ForegroundColor Yellow                    
    Write-Host "[12] Microsoft .NET Install                        [22] * Microsoft Fixed *                                             " -ForegroundColor Yellow
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[31] Setup Program Install ISO + EXE               [41] *** Winget Install  ***                                         " -ForegroundColor Blue
    Write-Host "[32] Setup Microsoft Office Install EXE            [42] *** Chocolatey Install ***                                      " -ForegroundColor Blue
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[90] *** Standard PC Install All in One ***        [91] Winget + Chocolatey Upgrade                                     " -ForegroundColor DarkRed
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[98] Windows Utility (winutil)                                                                                          " -ForegroundColor DarkGray
    Write-Host "[99] Microsoft Activation Scripts (MAS)                                                                                 " -ForegroundColor DarkGray
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[0] Exit                                                                                                                " -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
}

# Script indirme ve çalıştırma fonksiyonu
function Download-And-Execute-Script {
    param (
        [string]$Url
    )
    
    $tempFile = [System.IO.Path]::GetTempFileName() + ".cmd"
    try {
        Write-Host "Downloading script from $Url..."                                                                                     -ForegroundColor Yellow
        Invoke-WebRequest -Uri $Url -OutFile $tempFile
        Write-Host "Script downloaded to $tempFile"                                                                                      -ForegroundColor Green
        
        Write-Host "Executing script..."                                                                                                 -ForegroundColor Yellow
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$tempFile`"" -Wait -NoNewWindow
    } catch {
        Write-Host "An error occurred while processing the script: $_"                                                                   -ForegroundColor Red
    } finally {
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force
            Write-Host "Temporary file removed."                                                                                          -ForegroundColor Green
        }
    }
}

# Kullanıcı seçimlerini işleyen fonksiyon
function Handle-Choice {
    param (
        [int]$Choice
    )

    switch ($Choice) {
        1 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu01.cmd" }
        2 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu02.cmd" }
        3 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu03.cmd" }
        4 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu04.cmd" }
        5 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu05.cmd" }
        6 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu06.cmd" }
        7 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu07.cmd" }
        8 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu08.cmd" }
        9 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu09.cmd" }
        10 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu10.cmd" }
        11 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu11.cmd" }
        12 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu12.cmd" }
        21 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21.cmd" }
        22 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu22.cmd" }
        31 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu31.cmd" }
        32 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu32.cmd" }
        41 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/public/other/winget" }
        42 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/public/other/chocolatey" }

        90 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90.cmd" }

        91 { winget upgrade --all; choco upgrade chocolatey -y; choco upgrade all -y }

        98 { 
            Write-Host "You chose Windows Utility (winutil)."                                                                             -ForegroundColor Cyan
            $url = "https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/winutil.ps1"
            $scriptContent = (Invoke-WebRequest -Uri $url).Content
            Invoke-Expression $scriptContent
        }
        99 { 
            Write-Host "You chose Microsoft Activation Scripts (MAS)."                                                                    -ForegroundColor Cyan
            Start-Process powershell.exe -ArgumentList "irm https://massgrave.dev/get | iex" -Verb RunAs
        }
        0 { 
            # Clear the screen
            Clear-Host

            # Display the exit message
            Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Cyan
            Write-Host "--- Exit                      --- Thank you for using Software Installer ---                       CREATED BY MRLSx7 ---" -ForegroundColor Red
            Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Cyan
            Write-Host "Exiting..." -ForegroundColor Green

            # Wait for 2 seconds
            Start-Sleep -Seconds 2

            # Exit the script
            exit
        }
        default { Write-Host "Invalid choice, please try again."                                                                           -ForegroundColor Red }
    }
}

# Ana döngü menüyü görüntülemek ve seçimleri işlemek için
do {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    if ($choice -match '^\d+$') {
        $choice = [int]$choice
        Handle-Choice -Choice $choice
    } else {
        Write-Host "Invalid input. Please enter a number."                                                                               -ForegroundColor Red
    }
    if ($choice -ne 0) {
        Read-Host "Press Enter to return to the main menu"
    }
} while ($choice -ne 0)
