@echo off
cls
:menu_04
cls
echo -------------------------------------------------------------------
echo --- menu_04       --- Choco Install ---                         ---
echo -------------------------------------------------------------------
echo [1] FileZilla Server
echo [2] UniFi Network Application
echo [3] qBittorrent
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" choco install filezilla.server -y
if "%choice%"=="2" choco install ubiquiti-unifi-controller -y
if "%choice%"=="3" choco install qbittorrent -y
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
