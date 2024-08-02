@echo off
cls
:menu_32
cls
echo -------------------------------------------------------------------
echo --- menu_32    --- Setup Microsoft Office Installer EXE         --- 
echo -------------------------------------------------------------------
echo [1] Microsoft Office Enterprise 2007
echo [2] Microsoft Office Professional 2013
echo [3] Microsoft Office ProPlus 2016
echo [4] Microsoft Office ProPlus 2019
echo [5] Microsoft Office ProPlus 2021
echo [6] Microsoft Office Std 2013
echo [7] Microsoft Office Business 365
echo [8] Microsoft Office ProPlus 365
echo [9] Microsoft Visio Pro 365
echo [10] Microsoft Project Pro 365
echo -------------------------------------------------------------------
echo [99] Microsoft Activation Scripts
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" (
cls
echo ========================================================================================================================
echo Key	KGFVY-7733B-8WCK9-KTG64-BC7D8
echo ========================================================================================================================
start /wait "" "\\192.168.18.2\setup\source\office\office2007Enterprise_tr\Setup.exe"
pause
)
if "%choice%"=="2" start /wait "" "\\192.168.18.2\setup\source\office\office2013Pro_tr\setup64.exe"
if "%choice%"=="3" start /wait "" "\\192.168.18.2\setup\source\office\office2016ProPlus_tr\setup.exe"
if "%choice%"=="4" start /wait "" "\\192.168.18.2\setup\source\office\office2019ProPlus_tr\Setup64.exe"
if "%choice%"=="5" start /wait "" "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe"
if "%choice%"=="6" start /wait "" "\\192.168.18.2\setup\source\office\office2013Std_tr\setup.exe"
if "%choice%"=="7" start /wait "" "\\192.168.18.2\setup\source\office\office365Business_tr\Setup64.exe"
if "%choice%"=="8" start /wait "" "\\192.168.18.2\setup\source\office\office365ProPlus_tr\Setup64.exe"
if "%choice%"=="9" start /wait "" "\\192.168.18.2\setup\source\office\office365VisioPro_tr\Setup64.exe"
if "%choice%"=="10" start /wait "" "\\192.168.18.2\setup\source\office\office365ProjectPro_tr\Setup64.exe"
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="99" powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1 | iex"
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" 
::---------------------------------------------------------------------------------------------------------------------------
pause
goto menu_32
::---------------------------------------------------------------------------------------------------------------------------
