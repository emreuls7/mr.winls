@echo off
cls
:menu_11
cls
echo -------------------------------------------------------------------
echo --- menu_11 --- Microsoft Program Install ---                   ---
echo -------------------------------------------------------------------
echo [1]  Microsoft OneNote Store
echo [2]  Microsoft PC Manager
echo [3]  Microsoft OneDrive
echo [4]  Microsoft Teams
echo [5]  Microsoft PowerToys
echo [6]  Microsoft DirectX
echo [7]  Microsoft VCRedist 2005-2015+
echo [8]  Microsoft Dot Net Framework 3-4+
echo [9]  Grammarly for Windows
echo [10] Microsoft Remote Desktop Store
echo [11] Microsoft 365 Apps for enterprise
echo [12] Windows Scan
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id XPFFZHVGQWWLHB --accept-package-agreements --accept-source-agreements --silent"
if "%choice%"=="2" winget install Microsoft.PCManager -e
if "%choice%"=="3" winget install Microsoft.OneDrive -e
if "%choice%"=="4" winget install Microsoft.Teams -e
if "%choice%"=="5" winget install Microsoft.PowerToys -e
if "%choice%"=="6" winget install Microsoft.DirectX -e
if "%choice%"=="7" (
                    winget install Microsoft.VCRedist.2005.x86 -e
                    winget install Microsoft.VCRedist.2005.x64 -e
                    winget install Microsoft.VCRedist.2008.x86 -e
                    winget install Microsoft.VCRedist.2008.x64 -e
                    winget install Microsoft.VCRedist.2010.x86 -e
                    winget install Microsoft.VCRedist.2010.x64 -e
                    winget install Microsoft.VCRedist.2012.x86 -e
                    winget install Microsoft.VCRedist.2012.x64 -e
                    winget install Microsoft.VCRedist.2013.x86 -e
                    winget install Microsoft.VCRedist.2013.x64 -e
                    winget install Microsoft.VCRedist.2015+.x86 -e
                    winget install Microsoft.VCRedist.2015+.x64 -e
)
if "%choice%"=="8" (
                    choco install dotnet3.5 -y
                    choco install dotnet4.5.1 -y
                    choco install dotnet4.5.2 -y
)
if "%choice%"=="9" winget install Grammarly.Grammarly -e
if "%choice%"=="10" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9WZDNCRFJ3PS --accept-package-agreements --accept-source-agreements --silent"
if "%choice%"=="11" winget install Microsoft.Office -e
if "%choice%"=="12" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9WZDNCRFJ3PV --accept-package-agreements --accept-source-agreements --silent"
if "%choice%"=="13" goto install_programK13
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
goto menu_11
::---------------------------------------------------------------------------------------------------------------------------
