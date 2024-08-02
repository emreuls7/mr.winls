@echo off
cls
:menu_10
cls
echo -------------------------------------------------------------------
echo --- menu_02  --- Games Lounge Installer ---                     ---
echo -------------------------------------------------------------------
echo [1] Steam
echo [2] Epic Games Launcher
echo [3] EA app                                                                                                     
echo [4] Ubisoft Connect
echo [5] GOG GALAXY
echo [6] Rockstar Games Launcher
echo [7] Amazon Games
echo [8] Google Play Games Beta
echo [9] Blitz
echo ========================================================================================================================
echo [0] Exit
echo ========================================================================================================================
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" winget install Valve.Steam -e
if "%choice%"=="2" winget install EpicGames.EpicGamesLauncher -e
if "%choice%"=="3" winget install ElectronicArts.EADesktop -e
if "%choice%"=="4" winget install Ubisoft.Connect -e
if "%choice%"=="5" winget install GOG.Galaxy -e
if "%choice%"=="6" choco install rockstar-launcher -y
if "%choice%"=="7" winget install Amazon.Games -e
if "%choice%"=="8" winget install Google.PlayGames.Beta -e
if "%choice%"=="9" winget install Blitz.Blitz -e
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
goto menu_10
::---------------------------------------------------------------------------------------------------------------------------
