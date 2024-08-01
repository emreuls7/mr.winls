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
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------

set "tempDir=C:\Windows\Temp"

:: Create the directory if it doesn't exist
if not exist "%tempDir%" mkdir "%tempDir%"

:: Handle user choices
if "%choice%"=="1" (
    echo Downloading and executing menu21_1.cmd...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_1.cmd -OutFile '%tempDir%\menu21_1.cmd'"
    if exist "%tempDir%\menu21_1.cmd" (
        call "%tempDir%\menu21_1.cmd"
        del "%tempDir%\menu21_1.cmd"
    ) else (
        echo Failed to download menu21_1.cmd.
    )
) else if "%choice%"=="2" (
    echo Downloading and executing menu21_2.cmd...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_2.cmd -OutFile '%tempDir%\menu21_2.cmd'"
    if exist "%tempDir%\menu21_2.cmd" (
        call "%tempDir%\menu21_2.cmd"
        del "%tempDir%\menu21_2.cmd"
    ) else (
        echo Failed to download menu21_2.cmd.
    )
) else if "%choice%"=="3" (
    echo Downloading and executing menu21_3.cmd...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_3.cmd -OutFile '%tempDir%\menu21_3.cmd'"
    if exist "%tempDir%\menu21_3.cmd" (
        call "%tempDir%\menu21_3.cmd"
        del "%tempDir%\menu21_3.cmd"
    ) else (
        echo Failed to download menu21_3.cmd.
    )
) else if "%choice%"=="4" (
    echo Downloading and executing menu21_4.cmd...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_4.cmd -OutFile '%tempDir%\menu21_4.cmd'"
    if exist "%tempDir%\menu21_4.cmd" (
        call "%tempDir%\menu21_4.cmd"
        del "%tempDir%\menu21_4.cmd"
    ) else (
        echo Failed to download menu21_4.cmd.
    )
) else if "%choice%"=="0" (
    echo Downloading and executing program.ps1...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/program.ps1 -OutFile '%tempDir%\program.ps1'"
    if exist "%tempDir%\program.ps1" (
        call "%tempDir%\program.ps1"
        del "%tempDir%\program.ps1"
    ) else (
        echo Failed to download program.ps1.
    )
) else (
    echo Invalid choice. Please select a valid option.
)

::---------------------------------------------------------------------------------------------------------------------------
pause
goto menu_21
::---------------------------------------------------------------------------------------------------------------------------
