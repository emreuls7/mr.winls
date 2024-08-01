@echo off
cls
:menu_21_1
cls
echo -------------------------------------------------------------------
echo --- menu_21    --- * Sytem file Fixed * ---   CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1]  System File Checker
echo [2]  DISM Scan Health
echo [3]  DISM Check Health
echo [4]  DISM Restore Health
echo [5]  Group Policy Updates Forcing
echo [6] Enable SMB 1.0/CIFS File Sharing Support on Windows
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" sfc /scannow
if "%choice%"=="2" DISM /Online /Cleanup-Image /ScanHealth
if "%choice%"=="3" DISM /Online /Cleanup-Image /CheckHealth
if "%choice%"=="4" DISM /Online /Cleanup-Image /RestoreHealth
if "%choice%"=="5" gpupdate /force
if "%choice%"=="6" dism.exe /online /enable-feature /featurename:"SMB1Protocol"
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" (
    powershell -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_1.cmd -OutFile '%tempDir%\menu21.cmd'"
    call "%tempDir%\menu21_1.cmd"
    del "%tempDir%\menu21_1.cmd"
)
::---------------------------------------------------------------------------------------------------------------------------
pasue
goto menu_21_1
::---------------------------------------------------------------------------------------------------------------------------
