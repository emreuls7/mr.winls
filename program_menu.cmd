@echo off
color 0A
:ShowMenu
cls
echo ------------------------------------------------------------------------------------------------------------------------
echo --- Main Menu                  --- Welcome to Software Install ---                                 CREATED BY MRLSx7 ---
echo ------------------------------------------------------------------------------------------------------------------------
echo [1] * Program Install *                            [6]  Web Browser Install               
echo [2] Winget 1* Install                              [7]  VPN + Remote Install              
echo [3] Winget 2* Install                              [8]  Media Player Install              
echo [4] Choco Install                                  [9]  Chat Messenger Install            
echo [5] MS Store Install                               [10] Gaming Launcher Install           
echo ------------------------------------------------------------------------------------------------------------------------
echo [11] Microsoft Program Install                     [21] * Microsoft Windows Fixed *       
echo [12] Microsoft .NET Install                                                              
echo ------------------------------------------------------------------------------------------------------------------------
echo [31] Setup Program Install ISO + EXE               [41] * Winget Install *                
echo [32] Setup Microsoft Office Install EXE            [42] * Chocolatey Install *            
echo ------------------------------------------------------------------------------------------------------------------------
echo [90] *** Standard PC Install All in One ***        [91] Winget + Chocolatey Upgrade       
echo ------------------------------------------------------------------------------------------------------------------------
echo [98] Windows Utility (winutil)                     [99] Microsoft Activation Scripts (MAS)
echo ------------------------------------------------------------------------------------------------------------------------
echo [0] Exit                                                                                   
echo ------------------------------------------------------------------------------------------------------------------------
set /p choice=Enter your choice: 
echo ------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" goto ProgramInstall
if "%choice%"=="2" goto DownloadScript
if "%choice%"=="3" goto DownloadScript
if "%choice%"=="4" goto DownloadScript
if "%choice%"=="5" goto DownloadScript
if "%choice%"=="6" goto DownloadScript
if "%choice%"=="7" goto DownloadScript
if "%choice%"=="8" goto DownloadScript
if "%choice%"=="9" goto DownloadScript
if "%choice%"=="10" goto DownloadScript
if "%choice%"=="11" goto DownloadScript
if "%choice%"=="12" goto DownloadScript
if "%choice%"=="21" goto DownloadScript
if "%choice%"=="22" goto DownloadScript
if "%choice%"=="31" goto DownloadScript
if "%choice%"=="32" goto DownloadScript
if "%choice%"=="41" goto WingetInstall
if "%choice%"=="42" goto ChocolateyInstall
if "%choice%"=="90" goto DownloadScript
if "%choice%"=="91" goto UpgradeAll
if "%choice%"=="98" goto WinUtil
if "%choice%"=="99" goto MAS
if "%choice%"=="0" goto Exit
goto InvalidChoice

:ProgramInstall
echo Program Install selected. This functionality is not implemented in this example.
goto ShowMenu

:DownloadScript
echo Downloading and executing script...
set "url=https://raw.githubusercontent.com/emreuls7/mr.winls/menu/%choice%.cmd"
set "tempFile=%tempDir%\script_%choice%.cmd"
powershell -command "Invoke-WebRequest -Uri '%url%' -OutFile '%tempFile%'"
if exist "%tempFile%" (
    start /wait cmd /c "%tempFile%"
    del "%tempFile%"
) else (
    echo Failed to download script.
)
goto ShowMenu

:WingetInstall
echo *** Winget Install ***.
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1'))"
goto ShowMenu

:ChocolateyInstall
echo *** Chocolatey Install ***.
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1'))"
goto ShowMenu

:UpgradeAll
winget upgrade --all
choco upgrade chocolatey -y
choco upgrade all -y
goto ShowMenu

:WinUtil
echo You chose Windows Utility (winutil).
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/winutil.ps1').Content"
goto ShowMenu

:MAS
echo You chose Microsoft Activation Scripts (MAS).
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1').Content"
goto ShowMenu

:Exit
cls
echo ------------------------------------------------------------------------------------------------------------------------
echo --- Exit                      --- Thank you for using Software Installer ---                       CREATED BY MRLSx7 ---
echo ------------------------------------------------------------------------------------------------------------------------
echo Exiting...
timeout /t 2 /nobreak >nul
exit

:InvalidChoice
echo Invalid input, please try again.
timeout /t 2 /nobreak >nul
goto ShowMenu
