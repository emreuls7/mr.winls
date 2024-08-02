@echo off
cls

:menu_21_1
cls
echo -------------------------------------------------------------------
echo --- menu_21    --- * System File Fixed * ---                    ---
echo -------------------------------------------------------------------
echo [1] System File Checker
echo [2] DISM Scan Health
echo [3] DISM Check Health
echo [4] DISM Restore Health
echo [5] Group Policy Updates Forcing
echo [6] Enable SMB 1.0/CIFS File Sharing Support on Windows
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------

set /p choice="Enter your choice (0,1,2,3,4,5,6): "

:: Define temporary directory
set "tempDir=C:\Windows\Temp"

if "%choice%"=="1" (
    echo Running System File Checker...
    sfc /scannow
)

if "%choice%"=="2" (
    echo Running DISM Scan Health...
    DISM /Online /Cleanup-Image /ScanHealth
)

if "%choice%"=="3" (
    echo Running DISM Check Health...
    DISM /Online /Cleanup-Image /CheckHealth
)

if "%choice%"=="4" (
    echo Running DISM Restore Health...
    DISM /Online /Cleanup-Image /RestoreHealth
)

if "%choice%"=="5" (
    echo Forcing Group Policy Updates...
    gpupdate /force
)

if "%choice%"=="6" (
    echo Enabling SMB 1.0/CIFS File Sharing Support...
    dism.exe /online /enable-feature /featurename:"SMB1Protocol"
)

if "%choice%"=="0" (
    powershell -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21.cmd -OutFile '%tempDir%\menu21.cmd'"
    
    if exist "%tempDir%\menu21.cmd" (
        call "%tempDir%\menu21.cmd"
        del "%tempDir%\menu21.cmd"
)

:: Pause to let the user read the output
pause

:: Return to the menu
goto menu_21_1
