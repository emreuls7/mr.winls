@echo off
cls
:menu_02
cls
echo -------------------------------------------------------------------
echo --- menu_02     --- Winget 1 Install ---      CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1]  TechPowerUp GPU-Z
echo [2]  Crystal Disk Info
echo [3]  Crystal Disk Mark
echo [4]  Core Temp
echo [5]  Lightshot
echo [6]  Winget UI
echo [7]  Java 8
echo [8]  DisplayFusion
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
if "%choice%"=="8" winget install BinaryFortress.DisplayFusion -e
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

::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1 -OutFile '%tempDir%\program.ps1'"
    call "%tempDir%\program.ps1"
    del "%tempDir%\program.ps1"
)
::---------------------------------------------------------------------------------------------------------------------------
::pause
goto menu_02
::---------------------------------------------------------------------------------------------------------------------------
