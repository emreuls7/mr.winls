@echo off
cls
:menu_06
cls
echo -------------------------------------------------------------------
echo --- menu_06    --- Browser Install ---                          ---
echo -------------------------------------------------------------------
echo [1]  Google Chrome
echo [2]  Google Chrome Dev
echo [3]  Mozilla Firefox
echo [4]  Mozilla Firefox Developer Edition
echo [5]  Brave
echo [6]  Brave Dev
echo [7]  Opera Stable
echo [8]  Opera GX Stable
echo [9]  Safari
echo [10] Tor Browser
echo ------------------------------------------------------------------------------------------------------------------------
echo [0] Back to Main Menu
echo ------------------------------------------------------------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" winget install Google.Chrome -e
if "%choice%"=="2" winget install Google.Chrome.Dev -e
if "%choice%"=="3" winget install Mozilla.Firefox -e
if "%choice%"=="4" winget install Mozilla.Firefox.DeveloperEdition -e
if "%choice%"=="5" winget install Brave.Brave -e
if "%choice%"=="6" winget install Brave.Brave.Dev -e
if "%choice%"=="7" winget install Opera.Opera -e
if "%choice%"=="8" winget install Opera.OperaGX -e
if "%choice%"=="9" winget install Apple.Safari -e
if "%choice%"=="10" winget install TorProject.TorBrowser -e
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
goto menu_06
::---------------------------------------------------------------------------------------------------------------------------
