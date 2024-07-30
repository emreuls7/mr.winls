@echo off
cls
:menu_01
cls
echo ------------------------------------------------------------------------------------------------------------------------
echo --- menu_01                          --- *** Program Installer *** ---                             CREATED BY MRLSx7 ---
echo ------------------------------------------------------------------------------------------------------------------------
echo *winget install
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
echo ------------------------------------------------------------------------------------------------------------------------
echo *choco install
echo [21] Any To ISO
echo [22] WinSCP   
echo [23] FileZilla Client
echo [24] Advanced Port Scan
echo [25]
echo ------------------------------------------------------------------------------------------------------------------------
echo *msstore install
echo [31] iTop Easy Desktop 
echo [32]  
echo [33]
echo [34]
echo [35]
echo ------------------------------------------------------------------------------------------------------------------------
echo Key copy
echo [51] OBS Studio Teleport (18.2-copy)
echo [52] WinRar Key (18.2-copy)
echo [53] Revo Uninstaller Pro Key (18.2-copy)
echo [54] AOMEI Partitio Assistant Pro Key (18.2-copy)
echo [55] Internet Download Manager Activation Script
echo ------------------------------------------------------------------------------------------------------------------------
echo [0] Exit
echo ------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
echo ------------------------------------------------------------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" winget install PuTTY.PuTTY -e
if "%choice%"=="2" winget install Notepad++.Notepad++ -e
if "%choice%"=="3" winget install JetBrains.Toolbox -e
if "%choice%"=="4" winget install Microsoft.SQLServerManagementStudio -e
if "%choice%"=="5" winget install Microsoft.VisualStudioCode -e
if "%choice%"=="6" winget install Famatech.AdvancedIPScanner -e
if "%choice%"=="7" winget install QL-Win.QuickLook -e
if "%choice%"=="8" winget install DeepL.DeepL -e
if "%choice%"=="9" winget install Adobe.Acrobat.Reader.64-bit -e
if "%choice%"=="10" winget install AcroSoftwareInc.CutePDFWriter -e
if "%choice%"=="11" winget install OBSProject.OBSStudio -e
if "%choice%"=="12" winget install RARLab.WinRAR -e
if "%choice%"=="13" winget install Mozilla.Thunderbird -e
if "%choice%"=="14" winget install RevoUninstaller.RevoUninstallerPro -e
if "%choice%"=="15" winget install AOMEI.PartitionAssistant -e
if "%choice%"=="16" winget install Tonec.InternetDownloadManager -e
if "%choice%"=="17" winget install AdrienAllard.FileConverter -e
if "%choice%"=="18" winget install Nvidia.GeForceExperience -e
if "%choice%"=="19" winget install Intel.IntelDriverAndSupportAssistant -e
if "%choice%"=="20" winget install Rufus.Rufus -e
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="21" choco install anytoiso -y
if "%choice%"=="22" choco install winscp -y
if "%choice%"=="23" choco install filezilla -y
if "%choice%"=="24" choco install advanced-port-scanner -y
if "%choice%"=="25" 
if "%choice%"=="26" 
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="31" ( 
winget list --id XPFCJVZV10X2WV -e >nul 2>&1
if %errorlevel% equ 0 (
    echo The application is already installed. Updating now...
    winget upgrade --id XPFCJVZV10X2WV -e --accept-package-agreements --accept-source-agreements --silent
) else (
    echo The application is not installed. Installing...
    winget install --id XPFCJVZV10X2WV -e --accept-package-agreements --accept-source-agreements --silent
)
)
::iTop Easy Desktop  XPFCJVZV10X2WV
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="32" ( 
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="51" robocopy "\\192.168.18.2\setup\source\key-crack+\obs-teleport" "C:\Program Files\obs-studio\obs-plugins\64bit" obs-teleport.dll /IS
if "%choice%"=="52" robocopy "\\192.168.18.2\setup\source\setup\AnyToISO\AnyToISOcrack" "C:\Program Files (x86)\AnyToISO" anytoiso.exe /IS
if "%choice%"=="53" robocopy "\\192.168.18.2\setup\source\key-crack+\Revo_Uninstaller_Pro" "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro" revouninstallerpro5.lic /IS
if "%choice%"=="54" robocopy "\\192.168.18.2\setup\source\key-crack+\AOMEI_Partition_Assistant_Pro" "C:\Program Files (x86)\AOMEI Partition Assistant" cfg.ini /IS
if "%choice%"=="55" powershell -command "irm https://massgrave.dev/ias | iex"
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
::pause
goto menu_01
::---------------------------------------------------------------------------------------------------------------------------
