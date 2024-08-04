# Function to clear the screen and display the menu
function Show-Menu {
    Clear-Host
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "--- menu_01                          --- *** Program Installer *** ---                             CREATED BY MRLSx7 ---" -ForegroundColor Red
    Write-Host "----------------*winget install*-----------------------------------*winget install*-------------------------------------" -ForegroundColor Green
    Write-Host "[1]  PuTTY                                  [11] OBS Studio"
    Write-Host "[2]  Notepad++                              [12] WinRar"
    Write-Host "[3]  JetBrains Toolbox                      [13] Mozilla Thunderbird"
    Write-Host "[4]  Microsoft SQL Server Management        [14] Revo Uninstaller Pro"
    Write-Host "[5]  Microsoft Visual Studio Code           [15] AOMEI Partitio Assistant"
    Write-Host "[6]  Advanced IP Scanner                    [16] Internet Download Manager"
    Write-Host "[7]  QuickLook                              [17] File Converter"
    Write-Host "[8]  DeepL                                  [18] NVIDIA GeForce Experience"
    Write-Host "[9]  Adobe Acrobat Reader                   [19] Intel Driver Support Assistant"
    Write-Host "[10] Cute PDF Writer                        [20] Rufus"
    Write-Host "---------------*choco install*--------------------------------------*msstore install------------------------------------"  -ForegroundColor Green
    Write-Host "[21] Any To ISO                             [31] iTop Easy Desktop"
    Write-Host "[22] WinSCP                                 [32]"
    Write-Host "[23] FileZilla Client                       [33]"
    Write-Host "[24] Advanced Port Scan                     [34]"
    Write-Host "[25]                                        [35]"
    Write-Host "-----------------*keys*-------------------------------------------------------------------------------------------------"  -ForegroundColor Green
    Write-Host "[51] OBS Studio Teleport (18.2-copy)"
    Write-Host "[52] WinRar Key (18.2-copy)"
    Write-Host "[53] Revo Uninstaller Pro Key (18.2-copy)"
    Write-Host "[54] AOMEI Partitio Assistant Pro Key (18.2-copy)"
    Write-Host "[55] Internet Download Manager Activation Script"
    Write-Host "------------------------------------------------------------------------------------------------------------------------"  -ForegroundColor Green
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------"  -ForegroundColor Green
}

# Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

    switch ($choice) {
        1 { winget install PuTTY.PuTTY -e }
        2 { winget install Notepad++.Notepad++ -e }
        3 { winget install JetBrains.Toolbox -e }
        4 { winget install Microsoft.SQLServerManagementStudio -e }
        5 { winget install Microsoft.VisualStudioCode -e }
        6 { winget install Famatech.AdvancedIPScanner -e }
        7 { winget install QL-Win.QuickLook -e }
        8 { winget install DeepL.DeepL -e }
        9 { winget install Adobe.Acrobat.Reader.64-bit -e }
        10 { winget install AcroSoftwareInc.CutePDFWriter -e }
        11 { winget install OBSProject.OBSStudio -e }
        12 { winget install RARLab.WinRAR -e }
        13 { winget install Mozilla.Thunderbird -e }
        14 { winget install RevoUninstaller.RevoUninstallerPro -e }
        15 { winget install AOMEI.PartitionAssistant -e }
        16 { winget install Tonec.InternetDownloadManager -e }
        17 { winget install AdrienAllard.FileConverter -e }
        18 { winget install Nvidia.GeForceExperience -e }
        19 { winget install Intel.IntelDriverAndSupportAssistant -e }
        20 { winget install Rufus.Rufus -e }

        21 { choco install anytoiso -y }
        22 { choco install winscp -y }
        23 { choco install filezilla -y }
        24 { choco install advanced-port-scanner -y }

        31 {
            $appId = "XPFCJVZV10X2WV"
            if (winget list --id $appId -e) {
                Write-Host "The application is already installed. Updating now..."
                winget upgrade --id $appId -e --accept-package-agreements --accept-source-agreements --silent
            } else {
                Write-Host "The application is not installed. Installing..."
                winget install --id $appId -e --accept-package-agreements --accept-source-agreements --silent
            }
        }

        51 { robocopy "\\192.168.18.2\setup\source\key-crack+\obs-teleport" "C:\Program Files\obs-studio\obs-plugins\64bit" obs-teleport.dll /IS }
        52 { robocopy "\\192.168.18.2\setup\source\setup\AnyToISO\AnyToISOcrack" "C:\Program Files (x86)\AnyToISO" anytoiso.exe /IS }
        53 { robocopy "\\192.168.18.2\setup\source\key-crack+\Revo_Uninstaller_Pro" "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro" revouninstallerpro5.lic /IS }
        54 { robocopy "\\192.168.18.2\setup\source\key-crack+\AOMEI_Partition_Assistant_Pro" "C:\Program Files (x86)\AOMEI Partition Assistant" cfg.ini /IS }
        55 {
            Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_ias.ps1").Content
        }
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
    Read-Host
} while ($choice -ne 0)
