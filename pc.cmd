@echo off
:ShowMenu
cls
echo ----------------------------------------
echo ---      DEFAULT PC INSTALL          ---
echo ----------------------------------------
echo [1] USER DEFAULT SET
echo [2] INSTALL DEFAULT
echo [3] OFFICE INSTALL
echo ----------------------------------------
echo [0] Exit
echo ----------------------------------------

set /p choice=Enter your choice (0,1,2,3...) 

if "%choice%"=="0" goto End
if "%choice%"=="1" goto user_default
if "%choice%"=="2" goto install_default
if "%choice%"=="3" 


:user_default
timeout /t 3 >nul
cls

:: Disable User Account Control (UAC)
echo Disabling User Account Control (UAC)...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul 2>&1
echo UAC has been disabled.
timeout /t 1 >nul
cls

:: Turn off Windows Defender Firewall
echo Turning off Windows Defender Firewall...
netsh advfirewall set allprofiles state off
echo Windows Defender Firewall is turned off.
timeout /t 1 >nul
cls

:: Enable Network Discovery and File Sharing
echo Enabling Network Discovery and File Sharing...
:: Network Discovery and File Sharing might need to be enabled manually or through PowerShell
:: Starting related services
net start fdphost >nul 2>&1
net start fdrespub >nul 2>&1
net start upnphost >nul 2>&1
net start SSDPSRV >nul 2>&1
echo Network Discovery and File Sharing are enabled.
timeout /t 1 >nul
cls

:: Disable blank password use restriction
echo Disabling 'Accounts: Limit local account use of blank passwords to console logon only' setting...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" /t REG_DWORD /d 0 /f >nul 2>&1
echo Blank password use restriction has been disabled.
timeout /t 1 >nul
cls

:: Enable launching unsafe files in Internet Options
echo Enabling 'Launching applications and unsafe files' in Internet Options...
:: This step requires PowerShell; unable to set directly in CMD
:: Define the registry path for Internet Settings
echo Configuring Zone 0 - Internet
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v 1806 /t REG_DWORD /d 0 /f
if %ERRORLEVEL% neq 0 echo Failed to configure Zone 0 - Internet

echo Configuring Zone 1 - Local Intranet
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 1806 /t REG_DWORD /d 0 /f
if %ERRORLEVEL% neq 0 echo Failed to configure Zone 1 - Local Intranet

echo Configuring Zone 2 - Trusted Sites
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1806 /t REG_DWORD /d 0 /f
if %ERRORLEVEL% neq 0 echo Failed to configure Zone 2 - Trusted Sites

echo Configuring Zone 3 - Restricted Sites
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1806 /t REG_DWORD /d 0 /f
if %ERRORLEVEL% neq 0 echo Failed to configure Zone 3 - Restricted Sites

echo Configuring Zone 4 - My Computer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v 1806 /t REG_DWORD /d 0 /f
if %ERRORLEVEL% neq 0 echo Failed to configure Zone 4 - My Computer

echo Configuration completed.
echo Unsafe file launching has been enabled.
timeout /t 1 >nul
cls

:: Network Folder FIX
echo Network Folder FIX...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 1 /f >nul 2>&1
echo Network Folder insecure guest authentication has been enabled.
timeout /t 1 >nul
cls

:: Check and set Ultimate Performance power plan
echo Checking if Ultimate Performance power plan already exists...
powercfg /create "Ultimate Performance" e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61  
echo Ultimate Performance power plan has been set.
timeout /t 1 >nul
:: Disable Fast Startup
echo Disabling Fast Startup...
powercfg /h off
echo Fast Startup has been disabled.
timeout /t 1 >nul
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
echo Power management settings have been updated.
timeout /t 1 >nul
cls

:: Enable the local Administrator account
net user Administrator /active:yes

:: Set the password for the Administrator account
net user Administrator 412199

echo Administrator account has been enabled and password set.
timeout /t 1 >nul
cls

:: Enable Remote Desktop
:: Enable Remote Desktop in the registry
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d 0 /f >nul 2>&1

:: Enable Remote Desktop rule in Windows Firewall
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes >nul 2>&1

echo Remote Desktop has been enabled.
timeout /t 1 >nul
cls

:: Set the time zone to UTC+2
echo Setting the time zone to GTB UTC+2 Standard Time...

:: Set the time zone to "GTB Standard Time"
tzutil /s "GTB Standard Time"

echo Time zone has been set to GTB UTC+2 Standard Time.
timeout /t 1 >nul
cls

:: Set locale settings
echo Changing locale settings...

:: Set locale to "en-GB" (English - United Kingdom)
reg add "HKCU\Control Panel\International" /v Locale /t REG_SZ /d 00000809 /f >nul 2>&1
reg add "HKCU\Control Panel\International" /v LocaleName /t REG_SZ /d en-GB /f >nul 2>&1

echo Locale settings have been updated to English (United Kingdom).
timeout /t 1 >nul
cls

:: Remove Edge
echo Removing Microsoft Edge...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/rm-edgeboth.ps1' -OutFile '$env:TEMP\rm-edgeboth.ps1'; & '$env:TEMP\rm-edgeboth.ps1'"
echo Microsoft Edge has been removed.
timeout /t 1 >nul
cls

:: Install Winget
echo *** Winget Install ***.
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1')); winget upgrade --all"
timeout /t 1 >nul
cls

:: Install Chocolatey
echo *** Chocolatey Install ***.
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1')); choco upgrade chocolatey -y; choco upgrade all -y"
timeout /t 1 >nul
cls

:: Enable .NET Framework 3.5
echo Enabling .NET Framework 3.5...
dism /online /enable-feature /featurename:NetFx3
echo .NET Framework 3.5 has been enabled.
timeout /t 1 >nul
cls

:: Install .NET Framework 4.8
echo Installing .NET Framework 4.8...

:: Define the URL and output file path
powershell -Command "Invoke-WebRequest -Uri 'https://download.visualstudio.microsoft.com/download/pr/8e7dc3b5-17c5-42f3-8720-8a1d96c1f6b2/204ad9dc72807f8940dc93f74a885337/dotnet_framework_4.8.exe' -OutFile '%TEMP%\dotnet_framework_4.8.exe'"

:: Start the installer and wait for it to complete
start /wait "%TEMP%\dotnet_framework_4.8.exe" /quiet /norestart

:: Clean up the installer file
del "%TEMP%\dotnet_framework_4.8.exe"

echo .NET Framework 4.8 has been installed.
timeout /t 1 >nul
cls

:: Enable SMB1 Protocol
echo Enabling SMB1 Protocol...
dism /online /enable-feature /featurename:SMB1Protocol
echo SMB1 Protocol has been enabled.
timeout /t 1 >nul
cls

goto ShowMenu




:install_default


