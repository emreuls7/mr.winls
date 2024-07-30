@echo off
cls
:menu_05
cls
echo -------------------------------------------------------------------
echo --- menu_05     --- MS Store Install ---      CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1] MSI Center 
echo [2] MSI Driver App Center
echo [3]  
echo [4]  
echo [5]  
echo [6]  
echo [7]  
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" (
                    winget list --id 9NVMNJCR03XV -e >nul 2>&1
                    if %errorlevel% equ 0 (
                    echo Application already installed. Update in progress...
                    winget upgrade --id 9NVMNJCR03XV -e --accept-package-agreements --accept-source-agreements --silent
                    ) else (
                    echo The application is not installed. Installed...
                    winget install --id 9NVMNJCR03XV -e --accept-package-agreements --accept-source-agreements --silent
                    )
)
::MSI Center msstore 9NVMNJCR03XV
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="2" (
                    winget list --id 9P9WDH947752 -e >nul 2>&1
                    if %errorlevel% equ 0 (
                    echo Application already installed. Update in progress...
                    winget upgrade --id 9P9WDH947752 -e --accept-package-agreements --accept-source-agreements --silent
                    ) else (
                    echo The application is not installed. Installed...
                    winget install --id 9P9WDH947752 -e --accept-package-agreements --accept-source-agreements --silent
                    )
)
::MSI Driver App Center 9P9WDH947752 Unknown msstore 9P9WDH947752
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="3" 
if "%choice%"=="4" 
if "%choice%"=="5" 
if "%choice%"=="6" 
if "%choice%"=="7" 
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
pause
goto menu_05
::---------------------------------------------------------------------------------------------------------------------------
