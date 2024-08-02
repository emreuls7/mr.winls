@echo off
echo ----------------------------------------------------------------------------------------
echo Install List
echo -------------
echo Do you want to install it on your computer? (Yes(Y) / No(N):
set /p answer=
if /i "%answer%"=="Y" goto Y
if /i "%answer%"=="N" goto N

:Y
echo Installation process starting...
timeout 2
echo ------------------------
echo Disable User Account Control
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
echo Set ConsentPromptBehaviorAdmin to 0 (elevate without prompting)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
echo ------------------------
echo Turning off Windows Defender Firewall...
netsh advfirewall set allprofiles state off
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
echo ------------------------
echo Disabling 'Accounts: Limit local account use of blank passwords to console logon only' setting...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'LimitBlankPasswordUse' -Value 0"
echo ------------------------
echo Enabling "Launching applications and unsafe files" in Internet Options...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v 1806 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 1806 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1806 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1806 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v 1806 /t REG_DWORD /d 0 /f
echo ------------------------
echo Network Folder FIX...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f
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
echo ------------------------
echo Enable administrator account
net user administrator /active:yes
echo Set the password for administrator
net user administrator 412199
echo ------------------------
echo Enabling Remote Desktop for Administrator...
powershell -Command "Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0"
powershell -Command "Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'"
echo Remote Desktop has been enabled for Administrator.
echo ------------------------
echo Enable SMB 1.0/CIFS File Sharing Support on Windows
dism.exe /online /enable-feature /featurename:"SMB1Protocol"
echo ------------------------
echo winget instal

powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1'))"

::powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1'))
echo choco instal

powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1'))"

::powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1'))

echo ------------------------
timeout 2

choco install dotnet3.5 -y
echo ------------------------

choco install dotnet4.5.1 -y
echo ------------------------

choco install dotnet4.5.2 -y
echo ------------------------
timeout 2
echo ------------------------
winget install Microsoft.VCRedist.2005.x86 -e
winget install Microsoft.VCRedist.2005.x64 -e
winget install Microsoft.VCRedist.2008.x86 -e
winget install Microsoft.VCRedist.2008.x64 -e
winget install Microsoft.VCRedist.2010.x86 -e
winget install Microsoft.VCRedist.2010.x64 -e
winget install Microsoft.VCRedist.2012.x86 -e
winget install Microsoft.VCRedist.2012.x64 -e
winget install Microsoft.VCRedist.2013.x86 -e
winget install Microsoft.VCRedist.2013.x64 -e
winget install Microsoft.VCRedist.2015+.x86 -e
winget install Microsoft.VCRedist.2015+.x64 -e
echo ------------------------

winget install Google.Chrome -e
echo ------------------------

winget install Notepad++.Notepad++ -e
echo ------------------------

winget install RARLab.WinRAR -e
echo ------------------------

winget install VideoLAN.VLC -e
echo ------------------------

winget install Adobe.Acrobat.Reader.64-bit -e
echo ------------------------

winget install AcroSoftwareInc.CutePDFWriter -e
echo ------------------------

winget install AdrienAllard.FileConverter  -e
echo ------------------------

winget install uvncbvba.UltraVnc -e
echo ------------------------
echo winget choco upgrade
winget upgrade --all
choco upgrade chocolatey
choco upgrade all -y
echo ------------------------
timeout 2
echo ------------------------
echo Do you want to set up an ***OFFICE*** ? (Yes(Y) / No(N):
set /p answer=
if /i "%answer%"=="Y" goto Y
if /i "%answer%"=="N" goto N

:Y
start /wait "" "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe"

:N
echo ------------------------
timeout 2
REM Script'in URL'sini tanımla ve script'i indir
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/0884271c4fcdc72d95bce7c5c7bdf77ef4a9bcef/MAS/All-In-One-Version/MAS_AIO-CRC32_31F7FD1E.cmd' -OutFile '%TEMP%\MAS_AIO-CRC32_31F7FD1E.cmd'"

REM Script'i çalıştır
call "%TEMP%\MAS_AIO-CRC32_31F7FD1E.cmd"

REM Script'i çalıştırdıktan sonra geçici dosyayı sil
del "%TEMP%\MAS_AIO-CRC32_31F7FD1E.cmd"
echo ------------------------
pause
goto exit
echo ------------------------
:N
goto exit
