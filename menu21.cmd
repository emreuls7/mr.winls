@echo off
cls
:menu_21
cls
echo -------------------------------------------------------------------
echo --- menu_21    --- * Windows Fixed * ---      CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1] menu_21_1 System file Fixed
echo [2] menu_21_2 
echo [3] menu_21_3
echo [4] menu_21_4 OUTLOOK FIX
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------

:: Define temporary directory
set "tempDir=C:\Windows\Temp"

:: Handle user choices
if "%choice%"=="1" (
    echo Downloading and executing menu21_1.cmd...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_1.cmd -OutFile '%tempDir%\menu21_1.cmd'"
    if exist "%tempDir%\menu21_1.cmd" (
        call "%tempDir%\menu21_1.cmd"
        del "%tempDir%\menu21_1.cmd"
)
if "%choice%"=="2" (
    echo Downloading and executing menu21_2.cmd...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_2.cmd -OutFile '%tempDir%\menu21_2.cmd'"
    if exist "%tempDir%\menu21_2.cmd" (
        call "%tempDir%\menu21_2.cmd"
        del "%tempDir%\menu21_2.cmd"
)
if "%choice%"=="3" (
    echo Downloading and executing menu21_3.cmd...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_3.cmd -OutFile '%tempDir%\menu21_3.cmd'"
    if exist "%tempDir%\menu21_3.cmd" (
        call "%tempDir%\menu21_3.cmd"
        del "%tempDir%\menu21_3.cmd"
)
if "%choice%"=="4" (
    echo Downloading and executing menu21_4.cmd...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_4.cmd -OutFile '%tempDir%\menu21_4.cmd'"
    if exist "%tempDir%\menu21_4.cmd" (
        call "%tempDir%\menu21_4.cmd"
        del "%tempDir%\menu21_4.cmd"
)

if "%choice%"=="0" exit

::---------------------------------------------------------------------------------------------------------------------------
pause
goto menu_21
::---------------------------------------------------------------------------------------------------------------------------
