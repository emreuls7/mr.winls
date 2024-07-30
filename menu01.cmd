@echo off
cls
:menu_01
cls
echo ------------------------------------------------------------------------------------------------------------------------
echo --- menu_01                          --- *** Program Installer *** ---                             CREATED BY MRLSx7 ---
echo ----------------*winget install*-----------------------------------*winget install*-------------------------------------
echo [1]  PuTTY                                  [11] OBS Studio
echo [2]  Notepad++                              [12] WinRar
echo [3]  JetBrains Toolbox                      [13] Mozilla Thunderbird
echo [4]  Microsoft SQL Server Management        [14] Revo Uninstaller Pro
echo [5]  Microsoft Visual Studio Code           [15] AOMEI Partitio Assistant
echo [6]  Advanced IP Scanner                    [16] Internet Download Manager
echo [7]  QuickLook                              [17] File Converter
echo [8]  DeepL                                  [18] NVIDIA GeForce Experience 
echo [9]  Adobe Acrobat Reader                   [19] Intel Driver Support Assistant
echo [10] Cute PDF Writer                        [20] Rufus
echo ---------------*choco install*--------------------------------------*msstore install------------------------------------
echo [21] Any To ISO                             [31] iTop Easy Desktop
echo [22] WinSCP                                 [32]
echo [23] FileZilla Client                       [33]
echo [24] Advanced Port Scan                     [34]
echo [25]                                        [35]
echo -----------------*keys*-------------------------------------------------------------------------------------------------
echo [51] OBS Studio Teleport (18.2-copy)
echo [52] WinRar Key (18.2-copy)
echo [53] Revo Uninstaller Pro Key (18.2-copy)
echo [54] AOMEI Partitio Assistant Pro Key (18.2-copy)
echo [55] Internet Download Manager Activation Script
echo ------------------------------------------------------------------------------------------------------------------------
echo [0] Exit
echo ------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
cls
echo ------------------------------------------------------------------------------------------------------------------------

:: Check and install programs
if "%choice%"=="1" winget install PuTTY.PuTTY -e || echo Installation failed for PuTTY
if "%choice%"=="2" winget install Notepad++.Notepad++ -e || echo Installation failed for Notepad++
if "%choice%"=="3" winget install JetBrains.Toolbox -e || echo Installation failed for JetBrains Toolbox
if "%choice%"=="4" winget install Microsoft.SQLServerManagementStudio -e || echo Installation failed for SQL Server Management Studio
if "%choice%"=="5" winget install Microsoft.VisualStudioCode -e || echo Installation failed for Visual Studio Code
if "%choice%"=="6" winget install Famatech.AdvancedIPScanner -e || echo Installation failed for Advanced IP Scanner
if "%choice%"=="7" winget install QL-Win.QuickLook -e || echo Installation failed for QuickLook
if "%choice%"=="8" winget install DeepL.DeepL -e || echo Installation failed for DeepL
if "%choice%"=="9" winget install Adobe.Acrobat.Reader.64-bit -e || echo Installation failed for Adobe Acrobat Reader
if "%choice%"=="10" winget install AcroSoftwareInc.CutePDFWriter -e || echo Installation failed for Cute PDF Writer
if "%choice%"=="11" winget install OBSProject.OBSStudio -e || echo Installation failed for OBS Studio
if "%choice%"=="12" winget install RARLab.WinRAR -e || echo Installation failed for WinRar
if "%choice%"=="13" winget install Mozilla.Thunderbird -e || echo Installation failed for Mozilla Thunderbird
if "%choice%"=="14" winget install RevoUninstaller.RevoUninstallerPro -e || echo Installation failed for Revo Uninstaller Pro
if "%choice%"=="15" winget install AOMEI.PartitionAssistant -e || echo Installation failed for AOMEI Partition Assistant
if "%choice%"=="16" winget install Tonec.InternetDownloadManager -e || echo Installation failed for Internet Download Manager
if "%choice%"=="17" winget install AdrienAllard.FileConverter -e || echo Installation failed for File Converter
if "%choice%"=="18" winget install Nvidia.GeForceExperience -e || echo Installation failed for NVIDIA GeForce Experience
if "%choice%"=="19" winget install Intel.IntelDriverAndSupportAssistant -e || echo Installation failed for Intel Driver Support Assistant
if "%choice%"=="20" winget install Rufus.Rufus -e || echo Installation failed for Rufus

if "%choice%"=="21" choco install anytoiso -y || echo Installation failed for AnyToISO
if "%choice%"=="22" choco install winscp -y || echo Installation failed for WinSCP
if "%choice%"=="23" choco install filezilla -y || echo Installation failed for FileZilla Client
if "%choice%"=="24" choco install advanced-port-scanner -y || echo Installation failed for Advanced Port Scan

:: Handle msstore install for iTop Easy Desktop
if "%choice%"=="31" (
    winget list --id XPFCJVZV10X2WV -e >nul 2>&1
    if %errorlevel% equ 0 (
        echo The application is already installed. Updating now...
        winget upgrade --id XPFCJVZV10X2WV -e --accept-package-agreements --accept-source-agreements --silent || echo Update failed for iTop Easy Desktop
    ) else (
        echo The application is not installed. Installing...
        winget install --id XPFCJVZV10X2WV -e --accept-package-agreements --accept-source-agreements --silent || echo Installation failed for iTop Easy Desktop
    )
)

:: Key and script handling
if "%choice%"=="51" robocopy "\\192.168.18.2\setup\source\key-crack+\obs-teleport" "C:\Program Files\obs-studio\obs-plugins\64bit" obs-teleport.dll /IS || echo Copy failed for OBS Studio Teleport
if "%choice%"=="52" robocopy "\\192.168.18.2\setup\source\setup\AnyToISO\AnyToISOcrack" "C:\Program Files (x86)\AnyToISO" anytoiso.exe /IS || echo Copy failed for AnyToISO Key
if "%choice%"=="53" robocopy "\\192.168.18.2\setup\source\key-crack+\Revo_Uninstaller_Pro" "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro" revouninstallerpro5.lic /IS || echo Copy failed for Revo Uninstaller Pro Key
if "%choice%"=="54" robocopy "\\192.168.18.2\setup\source\key-crack+\AOMEI_Partition_Assistant_Pro" "C:\Program Files (x86)\AOMEI Partition Assistant" cfg.ini /IS || echo Copy failed for AOMEI Partition Assistant Pro Key
if "%choice%"=="55" powershell -command "https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_ias.ps1" || echo Activation script failed

if "%choice%"=="0" exit

:: Invalid choice handling
if "%choice%" LSS "0" (
    echo Invalid choice. Please try again.
)

pause
goto menu_01
