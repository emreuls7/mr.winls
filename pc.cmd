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
if "%choice%"=="3" goto install_office

goto ShowMenu

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

pause
goto ShowMenu






:install_default
cls
@echo off
echo Installing .NET Frameworks...

:: Install .NET Frameworks using Chocolatey
choco install dotnet3.5 -y >nul 2>&1 && echo dotnet3.5 installation complete.

choco install dotnet4.5.1 -y >nul 2>&1 && echo dotnet4.5.1 installation complete.

choco install dotnet4.5.2 -y >nul 2>&1 && echo dotnet4.5.2 installation complete.

:: Clear the console
cls

echo Installing VC Redistributables...

:: Directly define and install VC Redistributables
echo Installing Microsoft.VCRedist.2005.x86...
winget install Microsoft.VCRedist.2005.x86 -e >nul 2>&1 && echo Microsoft.VCRedist.2005.x86 installation complete.

echo Installing Microsoft.VCRedist.2005.x64...
winget install Microsoft.VCRedist.2005.x64 -e >nul 2>&1 && echo Microsoft.VCRedist.2005.x64 installation complete.

echo Installing Microsoft.VCRedist.2008.x86...
winget install Microsoft.VCRedist.2008.x86 -e >nul 2>&1 && echo Microsoft.VCRedist.2008.x86 installation complete.

echo Installing Microsoft.VCRedist.2008.x64...
winget install Microsoft.VCRedist.2008.x64 -e >nul 2>&1 && echo Microsoft.VCRedist.2008.x64 installation complete.

echo Installing Microsoft.VCRedist.2010.x86...
winget install Microsoft.VCRedist.2010.x86 -e >nul 2>&1 && echo Microsoft.VCRedist.2010.x86 installation complete.

echo Installing Microsoft.VCRedist.2010.x64...
winget install Microsoft.VCRedist.2010.x64 -e >nul 2>&1 && echo Microsoft.VCRedist.2010.x64 installation complete.

echo Installing Microsoft.VCRedist.2012.x86...
winget install Microsoft.VCRedist.2012.x86 -e >nul 2>&1 && echo Microsoft.VCRedist.2012.x86 installation complete.

echo Installing Microsoft.VCRedist.2012.x64...
winget install Microsoft.VCRedist.2012.x64 -e >nul 2>&1 && echo Microsoft.VCRedist.2012.x64 installation complete.

echo Installing Microsoft.VCRedist.2013.x86...
winget install Microsoft.VCRedist.2013.x86 -e >nul 2>&1 && echo Microsoft.VCRedist.2013.x86 installation complete.

echo Installing Microsoft.VCRedist.2013.x64...
winget install Microsoft.VCRedist.2013.x64 -e >nul 2>&1 && echo Microsoft.VCRedist.2013.x64 installation complete.

echo Installing Microsoft.VCRedist.2015+.x86...
winget install Microsoft.VCRedist.2015+.x86 -e >nul 2>&1 && echo Microsoft.VCRedist.2015+.x86 installation complete.

echo Installing Microsoft.VCRedist.2015+.x64...
winget install Microsoft.VCRedist.2015+.x64 -e >nul 2>&1 && echo Microsoft.VCRedist.2015+.x64 installation complete.

:: Clean up
cls

echo VC Redistributables installation complete.

@echo off

:: Install each software directly with winget
echo Installing Google Chrome...
winget install Google.Chrome -e >nul 2>&1
if %errorlevel% equ 0 (
    echo Google Chrome installation complete.
) else (
    echo Failed to install Google Chrome.
)

echo Installing Notepad++...
winget install Notepad++.Notepad++ -e >nul 2>&1
if %errorlevel% equ 0 (
    echo Notepad++ installation complete.
) else (
    echo Failed to install Notepad++.
)

echo Installing WinRAR...
winget install RARLab.WinRAR -e >nul 2>&1
if %errorlevel% equ 0 (
    echo WinRAR installation complete.
) else (
    echo Failed to install WinRAR.
)

echo Installing VLC Media Player...
winget install VideoLAN.VLC -e >nul 2>&1
if %errorlevel% equ 0 (
    echo VLC Media Player installation complete.
) else (
    echo Failed to install VLC Media Player.
)

echo Installing Adobe Acrobat Reader...
winget install Adobe.Acrobat.Reader.64-bit -e >nul 2>&1
if %errorlevel% equ 0 (
    echo Adobe Acrobat Reader installation complete.
) else (
    echo Failed to install Adobe Acrobat Reader.
)

echo Installing CutePDF Writer...
winget install AcroSoftwareInc.CutePDFWriter -e >nul 2>&1
if %errorlevel% equ 0 (
    echo CutePDF Writer installation complete.
) else (
    echo Failed to install CutePDF Writer.
)

echo Installing File Converter...
winget install AdrienAllard.FileConverter -e >nul 2>&1
if %errorlevel% equ 0 (
    echo File Converter installation complete.
) else (
    echo Failed to install File Converter.
)

echo Installing UltraVNC...
winget install uvncbvba.UltraVnc -e >nul 2>&1
if %errorlevel% equ 0 (
    echo UltraVNC installation complete.
) else (
    echo Failed to install UltraVNC.
)

echo Installing PC Manager...
winget install Microsoft.PCManager -e >nul 2>&1
if %errorlevel% equ 0 (
    echo PC Manager installation complete.
) else (
    echo Failed to install PC Manager.
)

echo Installing PowerToys...
winget install Microsoft.PowerToys -e >nul 2>&1
if %errorlevel% equ 0 (
    echo PowerToys installation complete.
) else (
    echo Failed to install PowerToys.
)

echo Installing Skype...
winget install Microsoft.Skype -e >nul 2>&1
if %errorlevel% equ 0 (
    echo Skype installation complete.
) else (
    echo Failed to install Skype.
)

echo Installing PowerShell...
winget install Microsoft.PowerShell -e >nul 2>&1
if %errorlevel% equ 0 (
    echo PowerShell installation complete.
) else (
    echo Failed to install PowerShell.
)

echo All installations are complete.

@echo off

:: Install WhatsApp
echo Installing WhatsApp...
powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9NKSQGP7F2NH --accept-package-agreements --accept-source-agreements --silent" >nul 2>&1
if %errorlevel% equ 0 (
    echo WhatsApp installation complete.
) else (
    echo Failed to install WhatsApp.
)

:: Install Windows Scan
echo Installing Windows Scan...
powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9WZDNCRFJ3PV --accept-package-agreements --accept-source-agreements --silent" >nul 2>&1
if %errorlevel% equ 0 (
    echo Windows Scan installation complete.
) else (
    echo Failed to install Windows Scan.
)

:: Clear the console
cls

:: Upgrade installed software
echo Upgrading installed software...
powershell -NoProfile -ExecutionPolicy Bypass -Command "winget upgrade --all" >nul 2>&1
if %errorlevel% equ 0 (
    echo Software upgrade complete.
) else (
    echo Failed to upgrade software.
)

:: Upgrade Chocolatey and all packages
choco upgrade chocolatey -y >nul 2>&1
if %errorlevel% equ 0 (
    echo Chocolatey upgrade complete.
) else (
    echo Failed to upgrade Chocolatey.
)

choco upgrade all -y >nul 2>&1
if %errorlevel% equ 0 (
    echo All Chocolatey packages upgraded.
) else (
    echo Failed to upgrade all Chocolatey packages.
)

echo All operations are complete.

:: Clear the console
cls

:: Define paths and commands directly
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    echo Google Chrome found at C:\Program Files\Google\Chrome\Application\chrome.exe
    
    :: Registry paths for HTTP and HTTPS
    reg add "HKCR\http\shell\open\command" /ve /d "\"C:\Program Files\Google\Chrome\Application\chrome.exe\" -- \"%%1\"" /f >nul 2>&1
    if %errorlevel% equ 0 (
        echo Google Chrome has been set as the default browser for HTTP.
    ) else (
        echo Failed to set Google Chrome as default browser for HTTP.
    )
    
    reg add "HKCR\https\shell\open\command" /ve /d "\"C:\Program Files\Google\Chrome\Application\chrome.exe\" -- \"%%1\"" /f >nul 2>&1
    if %errorlevel% equ 0 (
        echo Google Chrome has been set as the default browser for HTTPS.
    ) else (
        echo Failed to set Google Chrome as default browser for HTTPS.
    )
) else (
    echo Google Chrome not found at C:\Program Files\Google\Chrome\Application\chrome.exe. Please make sure it is installed.
)

cls

:: Define Adobe Reader path and registry paths
if exist "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" (
    echo Adobe Reader found at C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe
    
    :: Registry path for PDF files
    reg add "HKCR\.pdf\shell\open\command" /ve /d "\"C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe\" \"%%1\"" /f >nul 2>&1
    if %errorlevel% equ 0 (
        echo Adobe Reader has been set as the default PDF viewer.
    ) else (
        echo Failed to set Adobe Reader as default PDF viewer.
    )
) else (
    echo Adobe Reader not found at C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe. Please make sure it is installed.
)

cls

:: Define VLC path
if exist "C:\Program Files\VideoLAN\VLC\vlc.exe" (
    echo Configuring VLC...

    :: Associate file types with VLC
    echo Associating .mp4 with VLC...
    assoc .mp4=VLCFile >nul 2>&1
    echo Associating .avi with VLC...
    assoc .avi=VLCFile >nul 2>&1
    echo Associating .mkv with VLC...
    assoc .mkv=VLCFile >nul 2>&1
    echo Associating .mov with VLC...
    assoc .mov=VLCFile >nul 2>&1
    echo Associating .wmv with VLC...
    assoc .wmv=VLCFile >nul 2>&1
    echo Associating .flv with VLC...
    assoc .flv=VLCFile >nul 2>&1
    echo Associating .mp3 with VLC...
    assoc .mp3=VLCFile >nul 2>&1
    echo Associating .wav with VLC...
    assoc .wav=VLCFile >nul 2>&1

    :: Set VLC as the default media player for known file types
    echo Setting VLC as default media player...
    ftype VLCFile="C:\Program Files\VideoLAN\VLC\vlc.exe" "%%1" >nul 2>&1
    if %errorlevel% equ 0 (
        echo VLC has been set as the default media player.
    ) else (
        echo Failed to set VLC as default media player.
    )
) else (
    echo VLC not found. Please make sure it is installed.
)

cls

:: Define WinRAR path
if exist "C:\Program Files\WinRAR\WinRAR.exe" (
    echo Configuring WinRAR...

    :: List of file extensions to associate with WinRAR
    echo Associating .rar with WinRAR...
    assoc .rar=WinRARFile >nul 2>&1
    ftype WinRARFile="C:\Program Files\WinRAR\WinRAR.exe" "%%1" >nul 2>&1

    echo Associating .zip with WinRAR...
    assoc .zip=WinRARFile >nul 2>&1
    ftype WinRARFile="C:\Program Files\WinRAR\WinRAR.exe" "%%1" >nul 2>&1

    echo Associating .7z with WinRAR...
    assoc .7z=WinRARFile >nul 2>&1
    ftype WinRARFile="C:\Program Files\WinRAR\WinRAR.exe" "%%1" >nul 2>&1

    echo Associating .tar with WinRAR...
    assoc .tar=WinRARFile >nul 2>&1
    ftype WinRARFile="C:\Program Files\WinRAR\WinRAR.exe" "%%1" >nul 2>&1

    echo Associating .gz with WinRAR...
    assoc .gz=WinRARFile >nul 2>&1
    ftype WinRARFile="C:\Program Files\WinRAR\WinRAR.exe" "%%1" >nul 2>&1

    echo Associating .bz2 with WinRAR...
    assoc .bz2=WinRARFile >nul 2>&1
    ftype WinRARFile="C:\Program Files\WinRAR\WinRAR.exe" "%%1" >nul 2>&1

    echo Associating .xz with WinRAR...
    assoc .xz=WinRARFile >nul 2>&1
    ftype WinRARFile="C:\Program Files\WinRAR\WinRAR.exe" "%%1" >nul 2>&1

    echo Associating .iso with WinRAR...
    assoc .iso=WinRARFile >nul 2>&1
    ftype WinRARFile="C:\Program Files\WinRAR\WinRAR.exe" "%%1" >nul 2>&1

    echo WinRAR has been set as the default application for specified file types.
) else (
    echo WinRAR not found. Please make sure it is installed.
)

cls

:: Install UltraVNC
echo Installing UltraVNC...
winget install --id=UltraVNC.UltraVNC --source=winget >nul 2>&1

:: Wait for installation to complete
timeout /t 30 >nul

:: Configure UltraVNC password
echo Configuring UltraVNC password...

:: Define registry path and password
set regPath=HKLM\SOFTWARE\UltraVNC\Server
set regName=Password
set password=412199

:: Check if registry path exists
reg query "%regPath%" >nul 2>&1
if errorlevel 1 (
    :: Create registry path if it does not exist
    reg add "%regPath%" /f >nul 2>&1
)

:: Set registry value for password
reg add "%regPath%" /v "%regName%" /t REG_SZ /d "%password%" /f >nul 2>&1

:: Confirm success
if %ERRORLEVEL% == 0 (
    echo UltraVNC has been installed and the password has been set.
) else (
    echo Failed to install or configure UltraVNC.
)


cls

:: Define paths directly
if exist "C:\Program Files\PowerShell\7\pwsh.exe" (
    echo Updating PowerShell shortcut...

    :: Use PowerShell to update the shortcut
    powershell -Command ^
        $shell = New-Object -ComObject WScript.Shell; ^
        $shortcut = $shell.CreateShortcut([System.IO.Path]::Combine($env:USERPROFILE, "Desktop\Windows PowerShell.lnk")); ^
        $shortcut.TargetPath = "C:\Program Files\PowerShell\7\pwsh.exe"; ^
        $shortcut.WorkingDirectory = [System.IO.Path]::GetDirectoryName("C:\Program Files\PowerShell\7\pwsh.exe"); ^
        $shortcut.Save()

    echo PowerShell shortcut updated to point to PowerShell 7.
) else (
    echo PowerShell 7 is not installed or the path is incorrect.
)


cls

pause
goto ShowMenu





:install_office
cls

:: Confirm starting Office setup
set /p confirmOffice="Do you want to start the Office setup? (Yes(Y) / No(N)): "

:: Check user input
if /I "%confirmOffice%"=="Y" (
    echo Starting Office setup...
    :: Start Office setup and handle errors
    start "" "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe" || (
        echo Failed to start Office setup. The file may not be found or there was an issue with the path. Continuing with the script...
    )
    echo Office setup started successfully.
) else (
    echo Office setup will not be started. Continuing with the script...
)

:: Pause to allow user to view the previous message
timeout /t 2 /nobreak >nul


cls

:: Confirm whether to execute the Microsoft Activation Scripts (MAS)
set /p confirmMAS="Do you want to execute Microsoft Activation Scripts (MAS)? (Yes(Y) / No(N)): "

:: Check user input
if /I "%confirmMAS%"=="Y" (
    echo You chose Microsoft Activation Scripts (MAS).
    :: Download and execute the script
    powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1' -OutFile '%TEMP%\massgrave_mas.ps1'; Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File %TEMP%\massgrave_mas.ps1' -Wait"
    echo Script executed.
) else (
    echo Microsoft Activation Scripts (MAS) will not be executed. Continuing with the script...
)

:: Pause to allow user to view the previous message
timeout /t 2 /nobreak >nul

