@echo off
cls
:menu_01
cls
echo ------------------------------------------------------------------------------------------------------------------------
echo --- menu_01                          --- *** Program Installer *** ---                             CREATED BY MRLSx7 ---
echo ------------------------------------------------------------------------------------------------------------------------
echo [1]  'winget' PuTTY                                [21] 'winget' *OBS Studio*
echo [2]  'choco'  WinSCP                               [22] 'winget' ***WinRar***
echo [3]  'winget' *Notepad++                           [23] 'choco'  Any To ISO
echo [4]  'choco'  FileZilla Client                     [24] 'winget' Revo Uninstaller Pro
echo [5]  'winget' QuickLook 'winget'                   [25] 'winget' AOMEI Partitio Assistant
echo [6]  'winget' *Advanced IP Scanner                 [26] 'winget' Internet Download Manager
echo [7]  'choco'  Advanced Port Scan                   [27] OBS Studio Teleport (18.2-copy)   
echo [8]  'winget' DeepL                                [28] WinRar Key (18.2-copy)
echo [9]  'winget' Adobe Acrobat Reader                 [29] Revo Uninstaller Pro Key (18.2-copy)                 
echo [10] 'winget' Cute PDF Writer                      [30] AOMEI Partitio Assistant Pro Key (18.2-copy)            
echo [11] 'winget' File Converter                       [31] Internet Download Manager Activation Script
echo [12] 'winget' Mozilla Thunderbird 
echo ------------------------------------------------------------------------------------------------------------------------
echo [31] iTop Easy Desktop (msstore)
echo [32] Rufus (msstore)
echo ------------------------------------------------------------------------------------------------------------------------
echo [0] Exit
echo ------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
echo ------------------------------------------------------------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" winget install PuTTY.PuTTY -e
if "%choice%"=="2" choco install winscp -y
if "%choice%"=="3" winget install Notepad++.Notepad++ -e
if "%choice%"=="4" choco install filezilla -y
if "%choice%"=="5" winget install QL-Win.QuickLook -e
if "%choice%"=="6" winget install Famatech.AdvancedIPScanner -e
if "%choice%"=="7" choco install advanced-port-scanner -y
if "%choice%"=="8" winget install DeepL.DeepL -e
if "%choice%"=="9" winget install Adobe.Acrobat.Reader.64-bit -e
if "%choice%"=="10" winget install AcroSoftwareInc.CutePDFWriter -e
if "%choice%"=="11" winget install AdrienAllard.FileConverter -e
if "%choice%"=="12" winget install Mozilla.Thunderbird -e
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
::iTop Easy Desktop (msstore) XPFCJVZV10X2WV
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="32" ( 
winget list --id 9PC3H3V7Q9CH -e >nul 2>&1
if %errorlevel% equ 0 (
    echo The application is already installed. Updating now...
    winget upgrade --id 9PC3H3V7Q9CH -e --accept-package-agreements --accept-source-agreements --silent
) else (
    echo The application is not installed. Installing...
    winget install --id 9PC3H3V7Q9CH -e --accept-package-agreements --accept-source-agreements --silent
)
)
::RUFUS msstore 9PC3H3V7Q9CH
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="21" winget install OBSProject.OBSStudio -e
if "%choice%"=="22" winget install RARLab.WinRAR -e
if "%choice%"=="23" choco install anytoiso -y
if "%choice%"=="24" winget install RevoUninstaller.RevoUninstallerPro -e
if "%choice%"=="25" winget install AOMEI.PartitionAssistant -e
if "%choice%"=="26" winget install Tonec.InternetDownloadManager -e
if "%choice%"=="27" robocopy "\\192.168.18.2\setup\source\key-crack+\obs-teleport" "C:\Program Files\obs-studio\obs-plugins\64bit" obs-teleport.dll /IS
if "%choice%"=="28" robocopy "\\192.168.18.2\setup\source\setup\AnyToISO\AnyToISOcrack" "C:\Program Files (x86)\AnyToISO" anytoiso.exe /IS
if "%choice%"=="29" robocopy "\\192.168.18.2\setup\source\key-crack+\Revo_Uninstaller_Pro" "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro" revouninstallerpro5.lic /IS
if "%choice%"=="30" robocopy "\\192.168.18.2\setup\source\key-crack+\AOMEI_Partition_Assistant_Pro" "C:\Program Files (x86)\AOMEI Partition Assistant" cfg.ini /IS
if "%choice%"=="31" powershell -command "irm https://massgrave.dev/ias | iex"
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
::pause
goto menu_01
::---------------------------------------------------------------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
