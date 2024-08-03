@echo off
:menu
cls
echo ------------------------------------------------------------
echo ---       --- DEFAULT PC INSTALL ---                     ---
echo ------------------------------------------------------------
echo [1] USER DEFAULT SET
echo [2] INSTALL DEFAULT
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
set /p choice=Enter your choice (0,1,2,3...): 

if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2
if "%choice%"=="0" goto exit
echo Invalid choice, please try again.
timeout /t 2 /nobreak >nul
goto menu

:option1
cls
@echo off
title System Configuration

:: Clear the console
cls

:: Output introductory message
echo -----------------------
echo ---     User Set    ---
echo -----------------------
timeout /t 2 /nobreak >nul
cls

:: Disable User Account Control (UAC)
echo ------------------------
echo Disabling User Account Control (UAC)...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
cls

:: Turn off Windows Defender Firewall
echo ------------------------
echo Turning off Windows Defender Firewall...
netsh advfirewall set allprofiles state off
cls

:: Enable Network Discovery and File Sharing
echo ------------------------
echo Network Discovery and File Sharing have been enabled...
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

:: Start related services for Network Discovery and File Sharing
for %%s in (fdphost fdrespub upnphost SSDPSRV) do (
    sc config %%s start= auto
    sc start %%s
)
cls

:: Disable blank password use restriction
echo ------------------------
echo Disabling 'Accounts: Limit local account use of blank passwords to console logon only' setting...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f
cls

:: Enable launching unsafe files in Internet Options
echo ------------------------
echo Enabling 'Launching applications and unsafe files' in Internet Options...
for /L %%z in (0,1,4) do (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\%%z" /v 1806 /t REG_DWORD /d 0 /f
)
cls

:: Network Folder FIX
echo ------------------------
echo Network Folder FIX...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f
cls

:: Check and set Ultimate Performance power plan
echo ------------------------
echo Checking if Ultimate Performance power plan already exists...
powercfg /list | find "Ultimate Performance" >nul
if %errorlevel% == 0 (
    echo Ultimate Performance power plan already exists. Activating it...
    powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
) else (
    echo Ultimate Performance power plan does not exist. Creating it...
    powercfg /create "Ultimate Performance" e9a42b02-d5df-448d-aa00-03f14749eb61
    powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
)

:: Disable Fast Startup
echo Disabling Fast Startup...
powercfg /h off

:: Set power management settings to "Never"
echo Power management settings are being set to 'Never'...
powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0
powercfg /change disk-timeout-ac 0
powercfg /change disk-timeout-dc 0
powercfg /change hibernate-timeout-ac 0
powercfg /change hibernate-timeout-dc 0
cls

:: Enable administrator account and set password
echo ------------------------
echo Enabling administrator account...
net user Administrator /active:yes
echo Setting the password for administrator...
net user Administrator 412199
cls

:: Enable Remote Desktop
echo ------------------------
echo Enabling Remote Desktop for Administrator...
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes
cls

:: Set the time zone to UTC+2
echo ------------------------
tzutil /s "FLE Standard Time"

:: Get the current date and time and add 2 hours
echo ------------------------
for /f "tokens=1-4 delims=/ " %%a in ('wmic os get localdatetime ^| find "."') do (
    set dt=%%a
    set time=%%b
)
set /a hh=%time:~0,2%+2
set newtime=%dt%T%hh%%time:~2,2%
date %dt:~0,4%-%dt:~4,2%-%dt:~6,2%
time %hh%:%time:~2,2%
cls

:: Define the path to the Google Chrome executable
set chromePath="C:\Program Files\Google\Chrome\Application\chrome.exe"

:: Check if Chrome exists at the specified path
if exist %chromePath% (
    echo Google Chrome found at %chromePath%

    :: Define registry paths and values for HTTP and HTTPS protocols
    set regPathHttp="HKCR\http\shell\open\command"
    set regPathHttps="HKCR\https\shell\open\command"
    set chromeCommand="%chromePath% -- %%1"

    :: Set the default command for HTTP and HTTPS to Google Chrome
    reg add %regPathHttp% /v "(default)" /t REG_SZ /d %chromeCommand% /f
    reg add %regPathHttps% /v "(default)" /t REG_SZ /d %chromeCommand% /f

    :: Notify user
    echo Google Chrome has been set as the default browser for HTTP and HTTPS protocols.
) else (
    echo Google Chrome not found at %chromePath%. Please make sure it is installed.
)

:: Define the path to the Adobe Reader executable
set adobePath="C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

:: Check if Adobe Reader exists at the specified path
if exist %adobePath% (
    echo Adobe Reader found at %adobePath%

    :: Define registry path and value for PDF files
    set pd

goto menu

:option2
cls
@echo off
title System Configuration

:: Clear the console
cls

:: Output introductory message
echo -----------------------
echo --- Default Install ---
echo -----------------------
timeout /t 2 /nobreak >nul
cls

:: Install .NET Frameworks
echo ------------------------
echo Installing .NET Frameworks...
choco install dotnet3.5 -y
choco install dotnet4.5.1 -y
choco install dotnet4.5.2 -y
echo ------------------------

:: Install VC Redistributables
echo ------------------------
echo Installing VC Redistributables...
powershell -Command "winget install Microsoft.VCRedist.2005.x86 -e"
powershell -Command "winget install Microsoft.VCRedist.2005.x64 -e"
powershell -Command "winget install Microsoft.VCRedist.2008.x86 -e"
powershell -Command "winget install Microsoft.VCRedist.2008.x64 -e"
powershell -Command "winget install Microsoft.VCRedist.2010.x86 -e"
powershell -Command "winget install Microsoft.VCRedist.2010.x64 -e"
powershell -Command "winget install Microsoft.VCRedist.2012.x86 -e"
powershell -Command "winget install Microsoft.VCRedist.2012.x64 -e"
powershell -Command "winget install Microsoft.VCRedist.2013.x86 -e"
powershell -Command "winget install Microsoft.VCRedist.2013.x64 -e"
powershell -Command "winget install Microsoft.VCRedist.2015+.x86 -e"
powershell -Command "winget install Microsoft.VCRedist.2015+.x64 -e"
echo ------------------------

:: Install additional software
echo ------------------------
echo Installing additional software...
powershell -Command "winget install Google.Chrome -e"
powershell -Command "winget install Notepad++.Notepad++ -e"
powershell -Command "winget install RARLab.WinRAR -e"
powershell -Command "winget install VideoLAN.VLC -e"
powershell -Command "winget install Adobe.Acrobat.Reader.64-bit -e"
powershell -Command "winget install AcroSoftwareInc.CutePDFWriter -e"
powershell -Command "winget install AdrienAllard.FileConverter -e"
powershell -Command "winget install uvncbvba.UltraVnc -e"
echo ------------------------

:: Upgrade installed software
echo ------------------------
echo Upgrading installed software...
powershell -Command "winget upgrade --all"
powershell -Command "choco upgrade chocolatey"
powershell -Command "choco upgrade all -y"
echo ------------------------

:: Define the path to the Google Chrome executable
set "chromePath=C:\Program Files\Google\Chrome\Application\chrome.exe"

:: Check if Chrome exists at the specified path
if exist "%chromePath%" (
    echo Google Chrome found at %chromePath%

    :: Define registry paths and values for HTTP and HTTPS protocols
    set "regPathHttp=HKCR\http\shell\open\command"
    set "regPathHttps=HKCR\https\shell\open\command"
    set "chromeCommand=\"%chromePath%\" -- %%1"

    :: Set the default command for HTTP and HTTPS to Google Chrome
    reg add %regPathHttp% /v "(default)" /t REG_SZ /d %chromeCommand% /f
    reg add %regPathHttps% /v "(default)" /t REG_SZ /d %chromeCommand% /f

    :: Notify user
    echo Google Chrome has been set as the default browser for HTTP and HTTPS protocols.
) else (
    echo Google Chrome not found at %chromePath%. Please make sure it is installed.
)

:: Define the path to the Adobe Reader executable
set "adobePath=C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

:: Check if Adobe Reader exists at the specified path
if exist "%adobePath%" (
    echo Adobe Reader found at %adobePath%

    :: Define registry paths and values for PDF files
    set "pdfRegistryPath=HKCR\.pdf\shell\open\command"
    set "adobeCommand=\"%adobePath%\" %%1"

    :: Set the default command for PDF files to Adobe Reader
    reg add %pdfRegistryPath% /v "(default)" /t REG_SZ /d %adobeCommand% /f

    :: Notify user
    echo Adobe Reader has been set as the default PDF viewer.
) else (
    echo Adobe Reader not found at %adobePath%. Please make sure it is installed.
)

:: Prompt user for Office setup
set /p setupOffice=Do you want to set up OFFICE? (Yes(Y) / No(N)): 
if /I "%setupOffice%"=="Y" (
    start "" "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe"
)

:: Pause to allow user to view the previous message
timeout /t 2 /nobreak >nul
cls

:: Prompt user for Massgrave setup
set /p masOpen=mas open or? (Yes(Y) / No(N)): 
if /I "%masOpen%"=="Y" (
    powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1' -OutFile '$env:TEMP\massgrave_mas.ps1'"
    powershell -ExecutionPolicy Bypass -File "$env:TEMP\massgrave_mas.ps1"
)

echo --------------------------------------
echo --- BUNUDA BITIRDIN HADI IYISIN... ---
echo --------------------------------------

:: Pause to allow user to view the previous message
pause

echo --------------------------------
echo ---SEN GEDE RESTART AT AGA...---
echo --------------------------------

:: Prompt user for restart
:: Uncomment if restart is desired
:: set /p restart=Do you want to RESTART the computer? (Yes(Y) / No(N)): 
:: if /I "%restart%"=="Y" (
::     shutdown /r /f /t 0
:: ) else (
::     echo Exiting...
::     exit
:: )

:: Execute additional script
powershell -Command "Invoke-Expression (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90.ps1').Content"

goto menu

:exit
exit

