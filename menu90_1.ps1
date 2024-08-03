@echo off
cls
echo --------------------------
echo --- Default PC Install ---
echo --------------------------
echo Do you want to install it on your computer? (Yes(Y) / No(N):
set /p answer=
if /i "%answer%"=="Y" goto Y
if /i "%answer%"=="N" exit

:Y
echo Installation process starting...
timeout 1
cls
echo ------------------------
echo Disable User Account Control
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
echo Set ConsentPromptBehaviorAdmin to 0 (elevate without prompting)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
cls
echo ------------------------
echo Turning off Windows Defender Firewall...
netsh advfirewall set allprofiles state off
cls
echo ------------------------
echo Network Discovery and File Sharing have been enabled.
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
sc config fdphost start= auto
sc config fdrespub start= auto
sc config upnphost start= auto
sc config SSDPSRV start= auto
net start fdphost
net start fdrespub
net start upnphost
net start SSDPSRV
cls
echo ------------------------
echo Disabling 'Accounts: Limit local account use of blank passwords to console logon only' setting...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'LimitBlankPasswordUse' -Value 0"
cls
echo ------------------------
echo Enabling "Launching applications and unsafe files" in Internet Options...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v 1806 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 1806 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1806 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1806 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v 1806 /t REG_DWORD /d 0 /f
cls
echo ------------------------
echo Network Folder FIX...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f
cls
echo ------------------------
echo Checking if Ultimate Performance power plan already exists...
powercfg /list | findstr /i "e9a42b02-d5df-448d-aa00-03f14749eb61" >nul

if %errorlevel%==0 (
    echo Ultimate Performance power plan already exists. Activating it...
    powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
) else (
    echo Ultimate Performance power plan does not exist. Creating it...
    powercfg /create "Ultimate Performance" e9a42b02-d5df-448d-aa00-03f14749eb61"
    powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
)

echo Disabling Fast Startup...
:: Turn off Fast Startup
powercfg /h off

echo Power management settings are being set to "Never"...
powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0
powercfg /change disk-timeout-ac 0
powercfg /change disk-timeout-dc 0
powercfg /change hibernate-timeout-ac 0
powercfg /change hibernate-timeout-dc 0
cls
echo ------------------------
echo Enable administrator account
net user administrator /active:yes
echo Set the password for administrator
net user administrator 412199
cls
echo ------------------------
echo Enabling Remote Desktop for Administrator...
powershell -Command "Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0"
powershell -Command "Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'"
echo Remote Desktop has been enabled for Administrator.
cls
echo ------------------------
echo Enable SMB 1.0/CIFS File Sharing Support on Windows
echo -
echo bunu kurunca restart atmana gerek yok
dism.exe /online /enable-feature /featurename:"SMB1Protocol"
cls
echo ------------------------
echo winget install
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1'))"
cls
echo ------------------------
echo choco install
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1'))"
cls
echo -------------------------------
echo --- burda restart at 1 kere ---
echo -------------------------------
echo ------------------------------------
echo --- eger restart attıysan es gec ---
echo ------------------------------------
echo Do you want to ***RESTART*** the computer? (Yes(Y) / No(N)):
set /p answer=
if /i "%answer%"=="Y" shutdown.exe /r /t 00
