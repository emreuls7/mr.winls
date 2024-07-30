@echo off
cls
:menu_02
cls
echo -------------------------------------------------------------------
echo --- menu_02      --- Winget Install ---       CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1]  TechPowerUp GPU-Z
echo [2]  Crystal Disk Info
echo [3]  Crystal Disk Mark
echo [4]  Core Temp
echo [5]  Lightshot
echo [6]  Winget UI
echo [7]  Java 8
echo [8]  
echo [9]  Malwarebytes
echo [10] Telerik Fiddler Classic
echo [11] Termius
echo [12] GlassWire
echo [13] inZip
echo [14] Notion
echo [15] FL Studio
echo [16] NDI 6 Tools
echo [17] NDI 6 Runtime
echo [18] Python
echo [19] Node.js
echo [20] Unity
echo [21] CPUID CPU-Z MSI
echo [22] MSI Afterburner
echo [23] ASUS ArmouryCrate
echo [24] CPUID ROG CPU-Z
echo [25] Wireshark
echo [26] Keeper Password Manager
echo [27] JetBrains Toolbox
echo [28] Microsoft Visual Studio Code
echo [29] Microsoft Visual Studio Code Insiders
echo [30] Microsoft SQL Server Management
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" winget install TechPowerUp.GPU-Z -e
if "%choice%"=="2" winget install CrystalDewWorld.CrystalDiskInfo -e
if "%choice%"=="3" winget install CrystalDewWorld.CrystalDiskMark -e
if "%choice%"=="4" winget install ALCPU.CoreTemp -e
if "%choice%"=="5" winget install Skillbrains.Lightshot -e
if "%choice%"=="6" winget install SomePythonThings.WingetUIStore -e
if "%choice%"=="7" winget install Oracle.JavaRuntimeEnvironment -e
if "%choice%"=="8" winget install SoftDeluxe.FreeDownloadManager -e
if "%choice%"=="9" winget install Malwarebytes.Malwarebytes -e
if "%choice%"=="10" winget install Telerik.Fiddler.Classic -e
if "%choice%"=="11" winget install Termius.Termius -e
if "%choice%"=="12" winget install GlassWire.GlassWire -e
if "%choice%"=="13" winget install Corel.WinZip -e
if "%choice%"=="14" winget install Notion.Notion -e
if "%choice%"=="15" winget install ImageLine.FLStudio -e
if "%choice%"=="16" winget install NDI.NDITools -e
if "%choice%"=="17" winget install NDI.NDIRuntime -e
if "%choice%"=="18" winget install Python.Launcher -e
if "%choice%"=="19" winget install OpenJS.NodeJS -e
if "%choice%"=="20" winget install Unity.Unity.2020 -e
if "%choice%"=="21" winget install CPUID.CPU-Z.MSI -e
if "%choice%"=="22" winget install Guru3D.Afterburner -e
if "%choice%"=="23" winget install Asus.ArmouryCrate
if "%choice%"=="24" winget install CPUID.CPU-Z.ROG
if "%choice%"=="25" winget install WiresharkFoundation.Wireshark -e
if "%choice%"=="26" winget install Keeper.KeeperDesktop -e
if "%choice%"=="27" winget install JetBrains.Toolbox -e
if "%choice%"=="28" winget install Microsoft.VisualStudioCode -e
if "%choice%"=="29" winget install Microsoft.VisualStudioCode.Insiders -e
if "%choice%"=="30" winget install Microsoft.SQLServerManagementStudio -e
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
::pause
goto menu_02
::---------------------------------------------------------------------------------------------------------------------------
