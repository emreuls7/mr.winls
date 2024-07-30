@echo off
cls
:menu3
cls
echo -------------------------------------------------------------------
echo --- menu_03       --- Choco Install ---       CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1] 
echo [2] 
echo [3] 
echo [4] 
echo [5] 
echo [6]  FileZilla Server 
echo [7]  UniFi Network Application 
echo [8]  qBittorrent
echo [9]  
echo [10] 
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" 
if "%choice%"=="2" 
if "%choice%"=="3" 
if "%choice%"=="4" 
if "%choice%"=="5" 
if "%choice%"=="6" choco install filezilla.server -y
if "%choice%"=="7" choco install ubiquiti-unifi-controller -y
if "%choice%"=="8" choco install qbittorrent -y
::if "%choice%"=="9" goto install_programC9
::if "%choice%"=="10" goto install_programC10
::if "%choice%"=="11" goto install_programC11
::if "%choice%"=="12" goto install_programC12
::if "%choice%"=="13" goto install_programC13
::if "%choice%"=="14" goto install_programC14
::if "%choice%"=="15" goto install_programC15
::if "%choice%"=="16" goto install_programC16
::if "%choice%"=="17" goto install_programC17
::if "%choice%"=="18" goto install_programC18
::if "%choice%"=="19" goto install_programC19
::if "%choice%"=="20" goto install_programC20
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
