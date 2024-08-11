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
echo [5] FIX            [6] OTHER SOFT
echo ----------------------------------------
echo [11] WINUTIL       [22] MAS
echo ----------------------------------------
echo [33] WINGET        [44] CHOCO
echo ----------------------------------------
echo [  1. VE 2. SECENEKLER HER USERDA YAP  ]
echo ----------------------------------------
echo [0] Exit
echo ----------------------------------------

set /p choice=Enter your choice (0,1,2,3...) 

if "%choice%"=="0" exit
if "%choice%"=="1" goto user_default
if "%choice%"=="2" goto install_default
if "%choice%"=="3" goto install_office
if "%choice%"=="5" goto fix_menu
if "%choice%"=="6" goto other_soft
if "%choice%"=="11" goto win_util
if "%choice%"=="22" goto mas_mas
if "%choice%"=="33" goto winget_install
if "%choice%"=="44" goto choco_install
goto ShowMenu

:mas_mas
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm '\\192.168.18.2\setup\source\massgrave_mas.ps1' | iex"
pause
goto ShowMenu

:win_util
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm '\\192.168.18.2\setup\source\winutil.ps1' | iex"
pause
goto ShowMenu

:winget_install
cls
robocopy "\\192.168.18.2\setup\source\WinGetInstall" "C:\Windows\Temp\WinGetInstall"
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('\\192.168.18.2\setup\source\winget.ps1')); winget upgrade --all"
pause
goto ShowMenu

:choco_install
cls
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('\\192.168.18.2\setup\source\chocolatey.ps1')); choco upgrade chocolatey -y; choco upgrade all -y"
pause
goto ShowMenu



:other_soft
cls
echo ----------------------------------------------------
echo [1] Winget
echo [2] Choco
echo [3] MS Store
echo ----------------------------------------------------
echo [4] OBS Studio Teleport (18.2-copy)
echo [5] WinRar Key (18.2-copy)
echo [6] Revo Uninstaller Pro Key (18.2-copy)
echo [7] AOMEI Partitio Assistant Pro Key (18.2-copy)
echo [8] Internet Download Manager Activation Script
echo ----------------------------------------------------
echo [0] Exit
echo ----------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
echo ----------------------------------------------------

if "%choice%"=="0" goto ShowMenu
if "%choice%"=="1" goto winget_soft
if "%choice%"=="2" goto choco_soft
if "%choice%"=="3" goto msstore_soft

if "%choice%"=="4" robocopy "\\192.168.18.2\setup\source\key-crack+\obs-teleport" "C:\Program Files\obs-studio\obs-plugins\64bit" obs-teleport.dll /IS
if "%choice%"=="5" robocopy "\\192.168.18.2\setup\source\setup\AnyToISO\AnyToISOcrack" "C:\Program Files (x86)\AnyToISO" anytoiso.exe /IS
if "%choice%"=="6" robocopy "\\192.168.18.2\setup\source\key-crack+\Revo_Uninstaller_Pro" "C:\ProgramData\VS Revo Group\Revo Uninstaller Pro" revouninstallerpro5.lic /IS
if "%choice%"=="7" robocopy "\\192.168.18.2\setup\source\key-crack+\AOMEI_Partition_Assistant_Pro" "C:\Program Files (x86)\AOMEI Partition Assistant" cfg.ini /IS
if "%choice%"=="8" powershell -NoProfile -ExecutionPolicy Bypass -Command "\\192.168.18.2\setup\source\massgrave_ias.ps1"

pause
goto other_soft




:winget_soft
cls
echo ---------------------------------------------------------------------------------------------------------------------
echo [1]  PuTTY                             [11] OBS Studio                      [21] Google Chrome
echo [2]  Notepad++                         [12] WinRar                          [22] Google Chrome Dev
echo [3]  JetBrains Toolbox                 [13] Mozilla Thunderbird             [23] Mozilla Firefox
echo [4]  Microsoft SQL Server Management   [14] Revo Uninstaller Pro            [24] Mozilla Firefox Developer Edition
echo [5]  Microsoft Visual Studio Code      [15] AOMEI Partitio Assistant        [25] FortiClient VPN
echo [6]  Advanced IP Scanner               [16] Internet Download Manager       [26] Windscribe VPN
echo [7]  QuickLook                         [17] File Converter                  [27] ProtonVPN
echo [8]  DeepL                             [18] NVIDIA GeForce Experience       [28] Radmin VPN
echo [9]  Adobe Acrobat Reader              [19] Intel Driver Support Assistant  [29] AnyDesk
echo [10] Cute PDF Writer                   [20] Rufus                           [30] TeamViewer
echo ---------------------------------------------------------------------------------------------------------------------
echo [0] Exit
echo ---------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
echo ----------------------------------------------------

if "%choice%"=="0" goto other_soft
if "%choice%"=="1" winget install PuTTY.PuTTY -e
if "%choice%"=="2" winget install Notepad++.Notepad++ -e
if "%choice%"=="3" winget install JetBrains.Toolbox -e
if "%choice%"=="4" winget install Microsoft.SQLServerManagementStudio -e
if "%choice%"=="5" winget install Microsoft.VisualStudioCode -e
if "%choice%"=="6" winget install Famatech.AdvancedIPScanner -e
if "%choice%"=="7" winget install QL-Win.QuickLook -e
if "%choice%"=="8" winget install DeepL.DeepL -e
if "%choice%"=="9" winget install Adobe.Acrobat.Reader.64-bit -e
if "%choice%"=="10" winget install AcroSoftwareInc.CutePDFWriter -e
if "%choice%"=="11" winget install OBSProject.OBSStudio -e
if "%choice%"=="12" winget install RARLab.WinRAR -e
if "%choice%"=="13" winget install Mozilla.Thunderbird -e
if "%choice%"=="14" winget install RevoUninstaller.RevoUninstallerPro -e 
if "%choice%"=="15" winget install AOMEI.PartitionAssistant -e
if "%choice%"=="16" winget install Tonec.InternetDownloadManager -e
if "%choice%"=="17" winget install AdrienAllard.FileConverter -e
if "%choice%"=="18" winget install Nvidia.GeForceExperience -e
if "%choice%"=="19" winget install Intel.IntelDriverAndSupportAssistant -e
if "%choice%"=="20" winget install Rufus.Rufus -e
if "%choice%"=="21" winget install Google.Chrome -e
if "%choice%"=="22" winget install Google.Chrome.Dev -e
if "%choice%"=="23" winget install Mozilla.Firefox -e
if "%choice%"=="24" winget install Mozilla.Firefox.DeveloperEdition -e
if "%choice%"=="25" winget install Fortinet.FortiClientVPN -e
if "%choice%"=="26" winget install Windscribe.Windscribe -e
if "%choice%"=="27" winget install ProtonTechnologies.ProtonVPN -e
if "%choice%"=="28" winget install Radmin.VPN -e
if "%choice%"=="29" winget install AnyDeskSoftwareGmbH.AnyDesk -e
if "%choice%"=="30" winget install TeamViewer.TeamViewer -e

pause
goto winget_soft


:choco_soft
cls
echo --------------------------
echo [1] Any To ISO
echo [2] WinSCP
echo [3] FileZilla Client
echo [4] Advanced Port Scan
echo --------------------------
echo [0] Exit
echo --------------------------
set /p choice="Enter your choice (0,1,2,3...): "

if "%choice%"=="0" goto ShowMenu
if "%choice%"=="1" choco install anytoiso -y
if "%choice%"=="2" choco install winscp -y
if "%choice%"=="3" choco install filezilla -y
if "%choice%"=="4" choco install advanced-port-scanner -y

pause
goto choco_soft

:msstore_soft
cls
echo --------------------------
echo [1] iTop Easy Desktop
echo [1] 1Remote
echo --------------------------
echo [0] Exit
echo --------------------------

set /p choice="Enter your choice (0,1,2,3...): "

if "%choice%"=="0" goto ShowMenu
if "%choice%"=="1" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install --id XPFCJVZV10X2WV --accept-package-agreements --accept-source-agreements --silent"
if "%choice%"=="2" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install --id 9PNMNF92JNFP --accept-package-agreements --accept-source-agreements --silent"
pause
goto msstore_soft



:user_default
timeout /t 3 
cls

:: Disable User Account Control (UAC)
echo Disabling User Account Control (UAC)...

:: Kullanıcı Hesabı Denetimi (UAC) ozelligini devre dısı bırakır.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f

:: Yonetici izinleri için onay isteme davranısını degistirir (tam kontrol).
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f

echo UAC has been disabled.
timeout /t 1 
cls

:: Turn off Windows Defender Firewall
echo Turning off Windows Defender Firewall...

:: Guvenlik duvarını tum profiller için kapatır.
netsh advfirewall set allprofiles state off

:: Guvenlik duvarını tum profiller için açar.
::netsh advfirewall set allprofiles state on

:: Domain profili için guvenlik duvarını kapatır.
::netsh advfirewall set domainprofile state off

:: Domain profili için guvenlik duvarını açar.
::netsh advfirewall set domainprofile state on

:: Private (ozel) profili için guvenlik duvarını kapatır.
::netsh advfirewall set privateprofile state off

:: Private (ozel) profili için guvenlik duvarını açar.
::netsh advfirewall set privateprofile state on

:: Public (kamu) profili için guvenlik duvarını kapatır.
::netsh advfirewall set publicprofile state off

:: Public (kamu) profili için guvenlik duvarını açar.
::netsh advfirewall set publicprofile state on

:: Tum profillerin guvenlik duvarı ayarlarını goruntuler.
::netsh advfirewall show allprofiles

:: Domain profilinin guvenlik duvarı ayarlarını goruntuler.
::netsh advfirewall show domainprofile

:: Private (ozel) profilinin guvenlik duvarı ayarlarını goruntuler.
::netsh advfirewall show privateprofile

:: Public (kamu) profilinin guvenlik duvarı ayarlarını goruntuler.
::netsh advfirewall show publicprofile

echo Windows Defender Firewall is turned off.
timeout /t 1 
cls

:: Enable Network Discovery and File Sharing
echo Enabling Network Discovery and File Sharing...

:: Function Discovery Provider Host hizmetini baslatır.
net start fdphost

:: Function Discovery Resource Publication hizmetini baslatır.
net start fdrespub

:: UPnP Device Host hizmetini baslatır.
net start upnphost

:: Simple Service Discovery Protocol hizmetini baslatır.
net start SSDPSRV

echo Network Discovery and File Sharing are enabled.
timeout /t 1 
cls

:: Disable blank password use restriction
echo Disabling 'Accounts: Limit local account use of blank passwords to console logon only' setting...

:: Bos sifrelerle oturum açmayı sınırlayan ayarı kapatır.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" /t REG_DWORD /d 0 /f

echo Blank password use restriction has been disabled.
timeout /t 1 
cls

:: Enable launching unsafe files in Internet Options
echo Enabling 'Launching applications and unsafe files' in Internet Options...

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

echo Unsafe file launching has been enabled.

echo Disabling Security and Maintenance Notifications...

:: Disable Security Center Notifications
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableEnhancedNotification" /t REG_DWORD /d 1 /f
if %ERRORLEVEL% neq 0 echo Failed to disable Security Center Notifications

:: Disable Action Center Notifications
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast" /v "Enabled" /t REG_DWORD /d 0 /f
if %ERRORLEVEL% neq 0 echo Failed to disable Action Center Notifications

echo Configuration completed.
timeout /t 1 
cls

:: Network Folder FIX
echo Network Folder FIX...

:: LanmanWorkstation hizmeti için guvenli olmayan misafir kimlik dogrulamasını etkinlestirir.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 1 /f

echo Network Folder insecure guest authentication has been enabled.
timeout /t 1 
cls

:: Check and set Ultimate Performance power plan
echo Checking if Ultimate Performance power plan already exists...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 & for /f "tokens=2 delims={}" %%i in ('powercfg /list ^| findstr /R /C:"Ultimate Performance"') do powercfg /setactive %%i
echo Ultimate Performance power plan has been set.
timeout /t 1 
:: Disable Fast Startup
echo Disabling Fast Startup...
powercfg /h off
echo Fast Startup has been disabled.
timeout /t 1 
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
timeout /t 1 
cls

:: Enable the local Administrator account
net user Administrator /active:yes

:: Set the password for the Administrator account
net user Administrator 412199

echo Administrator account has been enabled and password set.
timeout /t 1 
cls

:: Enable Remote Desktop
echo Enable Remote Desktop in the registry
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d 0 /f 

:: Uzaktan masaustu baglantıları için guvenlik duvarı kurallarını etkinlestirir.
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

echo Remote Desktop has been enabled.
timeout /t 1 
cls

:: Set the time zone to UTC+2
echo Setting the time zone to GTB UTC+2 Standard Time...

:: Set the time zone to "GTB Standard Time"
tzutil /s "GTB Standard Time"

echo Time zone has been set to GTB UTC+2 Standard Time.

:: Set locale to "en-GB" (English - United Kingdom)
reg add "HKEY_CURRENT_USER\Control Panel\International" /v Locale /t REG_SZ /d 00000809 /f

rem Locale ayarını İngiltere İngilizcesi olarak ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v LocaleName /t REG_SZ /d "en-GB" /f

rem ulke ve dil ayarlarını İngiltere olarak ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sCountry /t REG_SZ /d "United Kingdom" /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sLanguage /t REG_SZ /d "0409" /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v iCountry /t REG_DWORD /d 44 /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v iDate /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v iTime /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v iFirstDayOfWeek /t REG_DWORD /d 1 /f

rem Kısa tarih formatını ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sShortDate /t REG_SZ /d "dd/MM/yyyy" /f

rem Uzun tarih formatını ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sLongDate /t REG_SZ /d "dddd, d MMMM yyyy" /f

rem Kısa saat formatını ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sShortTime /t REG_SZ /d "HH:mm" /f

rem Uzun saat formatını ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sLongTime /t REG_SZ /d "HH:mm:ss" /f

rem Ondalık sembolu ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sDecimal /t REG_SZ /d "." /f

rem Grup ayırıcı sembolu ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sGroup /t REG_SZ /d "," /f

rem Para birimi sembolunu ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sCurrency /t REG_SZ /d "£" /f

rem Para birimi biçimini ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sMonetary /t REG_SZ /d "£#,##0.00" /f

rem Yuzdelik biçimi ayarla
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sPercent /t REG_SZ /d "#,##0%" /f


echo Locale settings have been updated to English (United Kingdom).
timeout /t 1 
cls

:: Install Winget
echo *** Winget Install ***.
robocopy "\\192.168.18.2\setup\source\WinGetInstall" "C:\Windows\Temp\WinGetInstall"
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('\\192.168.18.2\setup\source\winget.ps1')); winget upgrade --all"
timeout /t 1 
cls

:: Install Chocolatey
echo *** Chocolatey Install ***.
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('\\192.168.18.2\setup\source\chocolatey.ps1')); choco upgrade chocolatey -y; choco upgrade all -y"
timeout /t 1 
cls

:: Enable .NET Framework 3.5
echo Enabling .NET Framework 3.5...
dism /online /enable-feature /featurename:NetFx3
echo .NET Framework 3.5 has been enabled.
timeout /t 1 
cls

:: Install .NET Framework 4.8
echo Installing .NET Framework 4.8...
robocopy "\\192.168.18.2\setup\source\dotnet" "C:\Windows\Temp\dotnet" NDP48-x86-x64-AllOS-ENU.exe
:: Define the URL and output file path
:: powershell -Command "Invoke-WebRequest -Uri '\\192.168.18.2\setup\source\dotnet\NDP48-x86-x64-AllOS-ENU.exe' -OutFile 'C:\Windows\Temp\dotnet\NDP48-x86-x64-AllOS-ENU.exe'"

:: Start the installer and wait for it to complete
start /wait "C:\Windows\Temp\dotnet\NDP48-x86-x64-AllOS-ENU.exe" /quiet /norestart

:: Clean up the installer file
:: del "C:\Windows\Temp\dotnet\NDP48-x86-x64-AllOS-ENU.exe"

echo .NET Framework 4.8 has been installed.
timeout /t 1 
cls

:: Remove Edge
echo Removing Microsoft Edge...
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm '\\192.168.18.2\setup\source\remove.edge.ps1' | iex"
echo Microsoft Edge has been removed.
timeout /t 1 
cls

:: Enable SMB1 Protocol
echo Enabling SMB1 Protocol...
dism /online /enable-feature /featurename:SMB1Protocol
echo SMB1 Protocol has been enabled.
timeout /t 1 
cls

pause
goto ShowMenu






:install_default
cls

echo Installing VC Redistributables...

:: Directly define and install VC Redistributables
echo Installing Microsoft.VCRedist.2005.x86...
winget install Microsoft.VCRedist.2005.x86 -e  && echo Microsoft.VCRedist.2005.x86 installation complete.

echo Installing Microsoft.VCRedist.2005.x64...
winget install Microsoft.VCRedist.2005.x64 -e  && echo Microsoft.VCRedist.2005.x64 installation complete.

echo Installing Microsoft.VCRedist.2008.x86...
winget install Microsoft.VCRedist.2008.x86 -e  && echo Microsoft.VCRedist.2008.x86 installation complete.

echo Installing Microsoft.VCRedist.2008.x64...
winget install Microsoft.VCRedist.2008.x64 -e  && echo Microsoft.VCRedist.2008.x64 installation complete.

echo Installing Microsoft.VCRedist.2010.x86...
winget install Microsoft.VCRedist.2010.x86 -e  && echo Microsoft.VCRedist.2010.x86 installation complete.

echo Installing Microsoft.VCRedist.2010.x64...
winget install Microsoft.VCRedist.2010.x64 -e  && echo Microsoft.VCRedist.2010.x64 installation complete.

echo Installing Microsoft.VCRedist.2012.x86...
winget install Microsoft.VCRedist.2012.x86 -e  && echo Microsoft.VCRedist.2012.x86 installation complete.

echo Installing Microsoft.VCRedist.2012.x64...
winget install Microsoft.VCRedist.2012.x64 -e  && echo Microsoft.VCRedist.2012.x64 installation complete.

echo Installing Microsoft.VCRedist.2013.x86...
winget install Microsoft.VCRedist.2013.x86 -e  && echo Microsoft.VCRedist.2013.x86 installation complete.

echo Installing Microsoft.VCRedist.2013.x64...
winget install Microsoft.VCRedist.2013.x64 -e  && echo Microsoft.VCRedist.2013.x64 installation complete.

echo Installing Microsoft.VCRedist.2015+.x86...
winget install Microsoft.VCRedist.2015+.x86 -e  && echo Microsoft.VCRedist.2015+.x86 installation complete.

echo Installing Microsoft.VCRedist.2015+.x64...
winget install Microsoft.VCRedist.2015+.x64 -e  && echo Microsoft.VCRedist.2015+.x64 installation complete.

echo VC Redistributables installation complete.

:: Clean up
cls

:: Install each software directly with winget
echo Installing Google Chrome...
winget install Google.Chrome -e 
if %errorlevel% equ 0 (
    echo Google Chrome installation complete.
) else (
    echo Failed to install Google Chrome.
)

echo Installing Notepad++...
winget install Notepad++.Notepad++ -e 
if %errorlevel% equ 0 (
    echo Notepad++ installation complete.
) else (
    echo Failed to install Notepad++.
)

echo Installing WinRAR...
winget install RARLab.WinRAR -e 
if %errorlevel% equ 0 (
    echo WinRAR installation complete.
) else (
    echo Failed to install WinRAR.
)

echo Installing VLC Media Player...
winget install VideoLAN.VLC -e 
if %errorlevel% equ 0 (
    echo VLC Media Player installation complete.
) else (
    echo Failed to install VLC Media Player.
)

echo Installing Adobe Acrobat Reader...
winget install Adobe.Acrobat.Reader.64-bit -e 
if %errorlevel% equ 0 (
    echo Adobe Acrobat Reader installation complete.
) else (
    echo Failed to install Adobe Acrobat Reader.
)

echo Installing CutePDF Writer...
winget install AcroSoftwareInc.CutePDFWriter -e 
if %errorlevel% equ 0 (
    echo CutePDF Writer installation complete.
) else (
    echo Failed to install CutePDF Writer.
)

echo Installing File Converter...
winget install AdrienAllard.FileConverter -e 
if %errorlevel% equ 0 (
    echo File Converter installation complete.
) else (
    echo Failed to install File Converter.
)

echo Installing PC Manager...
winget install Microsoft.PCManager -e 
if %errorlevel% equ 0 (
    echo PC Manager installation complete.
) else (
    echo Failed to install PC Manager.
)

echo Installing PowerToys...
winget install Microsoft.PowerToys -e 
if %errorlevel% equ 0 (
    echo PowerToys installation complete.
) else (
    echo Failed to install PowerToys.
)

echo Installing Skype...
winget install Microsoft.Skype -e 
if %errorlevel% equ 0 (
    echo Skype installation complete.
) else (
    echo Failed to install Skype.
)

echo Installing PowerShell...
winget install Microsoft.PowerShell -e 
if %errorlevel% equ 0 (
    echo PowerShell installation complete.
) else (
    echo Failed to install PowerShell.
)

:: Install WhatsApp
echo Installing WhatsApp...
powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9NKSQGP7F2NH --accept-package-agreements --accept-source-agreements --silent" 
if %errorlevel% equ 0 (
    echo WhatsApp installation complete.
) else (
    echo Failed to install WhatsApp.
)

:: Install Windows Scan
echo Installing Windows Scan...
powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9WZDNCRFJ3PV --accept-package-agreements --accept-source-agreements --silent" 
if %errorlevel% equ 0 (
    echo Windows Scan installation complete.
) else (
    echo Failed to install Windows Scan.
)

cls
pause
goto ShowMenu





:install_office
cls
echo -------------------------------------------------------------------
echo      Setup Microsoft Office Installer EXE       
echo -------------------------------------------------------------------
echo [1] Microsoft Office Enterprise 2007
echo [2] Microsoft Office Professional 2013
echo [3] Microsoft Office ProPlus 2016
echo [4] Microsoft Office ProPlus 2019
echo [5] Microsoft Office ProPlus 2021
echo [6] Microsoft Office Std 2013
echo [7] Microsoft Office Business 365
echo [8] Microsoft Office ProPlus 365
echo [9] Microsoft Visio Pro 365
echo [10] Microsoft Project Pro 365
echo -------------------------------------------------------------------
echo [99] Microsoft Activation Scripts
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" goto ShowMenu

if "%choice%"=="1" (
cls
echo ========================================================================================================================
echo Key	KGFVY-7733B-8WCK9-KTG64-BC7D8
echo ========================================================================================================================
start /wait "" "\\192.168.18.2\setup\source\office\office2007Enterprise_tr\Setup.exe"
pause
)
if "%choice%"=="2" start /wait "" "\\192.168.18.2\setup\source\office\office2013Pro_tr\setup64.exe"
if "%choice%"=="3" start /wait "" "\\192.168.18.2\setup\source\office\office2016ProPlus_tr\setup.exe"
if "%choice%"=="4" start /wait "" "\\192.168.18.2\setup\source\office\office2019ProPlus_tr\Setup64.exe"
if "%choice%"=="5" start /wait "" "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe"
if "%choice%"=="6" start /wait "" "\\192.168.18.2\setup\source\office\office2013Std_tr\setup.exe"
if "%choice%"=="7" start /wait "" "\\192.168.18.2\setup\source\office\office365Business_tr\Setup64.exe"
if "%choice%"=="8" start /wait "" "\\192.168.18.2\setup\source\office\office365ProPlus_tr\Setup64.exe"
if "%choice%"=="9" start /wait "" "\\192.168.18.2\setup\source\office\office365VisioPro_tr\Setup64.exe"
if "%choice%"=="10" start /wait "" "\\192.168.18.2\setup\source\office\office365ProjectPro_tr\Setup64.exe"
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="99" powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm \\192.168.18.2\setup\source\massgrave_mas.ps1 | iex"



pause
goto install_office




:fix_menu
cls
echo -------------------------------------------------------------------
echo                         Windows Fixed
echo -------------------------------------------------------------------
echo [1] Fix 1 System file Fixed
echo [2] Fix 2
echo [3] Fix 3
echo [4] Fix 4 OUTLOOK FIX
echo [4] Fix 5 UPDATE
echo [4] Fix 6 POWER OPTIONS
echo -------------------------------------------------------------------
echo [0] Back Menu
echo -------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...) "

if "%choice%"=="0" goto ShowMenu 
if "%choice%"=="1" goto fix1
if "%choice%"=="2" goto fix2
if "%choice%"=="3" goto fix3
if "%choice%"=="4" goto fix4
if "%choice%"=="5" goto fix5
if "%choice%"=="6" goto fix6
goto ShowMenu



:fix1
cls
echo -------------------------------------------------------------------
echo ---            --- * System File Fixed * ---                    ---
echo -------------------------------------------------------------------
echo [1] System File Checker
echo [2] DISM Scan Health
echo [3] DISM Check Health
echo [4] DISM Restore Health
echo [5] Group Policy Updates Forcing
echo [6] Enable SMB 1.0/CIFS File Sharing Support on Windows
echo -------------------------------------------------------------------
echo [0] Back Menu
echo -------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...) "

if "%choice%"=="0" goto fix_menu
if "%choice%"=="1" goto SystemFileChecker
if "%choice%"=="2" goto DISMScanHealth
if "%choice%"=="3" goto DISMCheckHealth
if "%choice%"=="4" goto DISMRestoreHealth
if "%choice%"=="5" goto GroupPolicyUpdate
if "%choice%"=="6" goto EnableSMB
pause goto fix1

:SystemFileChecker
echo Running System File Checker...
sfc /scannow
pause 
goto fix1

:DISMScanHealth
echo Running DISM Scan Health...
DISM /Online /Cleanup-Image /ScanHealth
pause 
goto fix1

:DISMCheckHealth
echo Running DISM Check Health...
DISM /Online /Cleanup-Image /CheckHealth
pause 
goto fix1

:DISMRestoreHealth
echo Running DISM Restore Health...
DISM /Online /Cleanup-Image /RestoreHealth
pause 
goto fix1

:GroupPolicyUpdate
echo Forcing Group Policy Updates...
gpupdate /force
pause 
goto fix1

:EnableSMB
echo Enabling SMB 1.0/CIFS File Sharing Support...
dism.exe /online /enable-feature /featurename:"SMB1Protocol"
pause 
goto fix1

:InvalidChoice
echo Invalid choice. Please try again.
pause 
goto fix1


:fix2
cls
echo -------------------------------------------------------------------
echo ---             --- * Windows Fixed * ---                       ---
echo -------------------------------------------------------------------
echo [1] Disable User Account Control
echo [2] Enable User Account Control
echo [3] Turning off Windows Defender Firewall
echo [4] Turning on Windows Defender Firewall
echo [5] Network Folder FIX
echo [6] Enable Network Discovery
echo [7] Remove 'Open File - Security Warning' Prompt on Windows
echo [8] Restore 'Open File - Security Warning' Prompt on Windows
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...) "

if "%choice%"=="0" goto fix_menu
if "%choice%"=="1" goto DisableUAC
if "%choice%"=="2" goto EnableUAC
if "%choice%"=="3" goto TurnOffFirewall
if "%choice%"=="4" goto TurnOnFirewall
if "%choice%"=="5" goto NetworkFolderFix
if "%choice%"=="6" goto EnableNetworkDiscovery
if "%choice%"=="7" goto RemoveSecurityWarning
if "%choice%"=="8" goto RestoreSecurityWarning
goto fix2


:DisableUAC
echo Disabling User Account Control...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
echo User Account Control disabled. You need to restart your computer for changes to take effect.
pause 
goto fix2

:EnableUAC
echo Enabling User Account Control...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f
echo User Account Control enabled. You need to restart your computer for changes to take effect.
pause 
goto fix2

:TurnOffFirewall
echo Turning off Windows Defender Firewall...
netsh advfirewall set allprofiles state off
echo Windows Defender Firewall turned off.
pause 
goto fix2

:TurnOnFirewall
echo Turning on Windows Defender Firewall...
netsh advfirewall set allprofiles state on
echo Windows Defender Firewall turned on.
pause 
goto fix2

:NetworkFolderFix
echo Fixing Network Folder settings...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f
echo Network Folder settings updated.
pause 
goto fix2

:EnableNetworkDiscovery
echo Enabling Network Discovery...
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
sc config fdphost start=auto
sc config fdrespub start=auto
sc config upnphost start=auto
sc config SSDPSRV start=auto
net start fdphost
net start fdrespub
net start upnphost
net start SSDPSRV
echo Network Discovery enabled.
pause 
goto fix2

:RemoveSecurityWarning
echo Removing 'Open File - Security Warning' Prompt...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v LowRiskFileTypes /t REG_SZ /d ".exe;.bat;.reg;.vbs;.js;.msi" /f
echo 'Open File - Security Warning' Prompt removed.
pause 
goto fix2

:RestoreSecurityWarning
echo Restoring 'Open File - Security Warning' Prompt...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v LowRiskFileTypes /f
echo 'Open File - Security Warning' Prompt restored.
pause 
goto fix2



:fix3
cls
echo -------------------------------------------------------------------
echo ---            --- * Windows Fixed * ---                        ---
echo -------------------------------------------------------------------
echo [1] Disabling 'Accounts: Limit local account use of blank passwords to console logon only'
echo [2] Enabling 'Launching applications and unsafe files' in Internet Options
echo [3] Enable Administrator Account
echo [4] Set Administrator Password ( admin )
echo [5] Enabling Remote Desktop for Administrator
echo [6] User Creation ( scan )
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...) "

if "%choice%"=="0" goto fix_menu
if "%choice%"=="1" goto DisableBlankPassword
if "%choice%"=="2" goto EnableUnsafeFiles
if "%choice%"=="3" goto EnableAdminAccount
if "%choice%"=="4" goto SetAdminPassword
if "%choice%"=="5" goto EnableRemoteDesktop
if "%choice%"=="6" goto CreateUserScan
goto fix3

:DisableBlankPassword
echo Disabling 'Accounts: Limit local account use of blank passwords to console logon only'...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f
echo Blank password use limit disabled.
pause 
goto fix3

:EnableUnsafeFiles
echo Enabling 'Launching applications and unsafe files' in Internet Options...
for /L %%i in (0,1,4) do (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\%%i" /v 1806 /t REG_DWORD /d 0 /f
)
echo 'Launching applications and unsafe files' enabled.
pause 
goto fix3

:EnableAdminAccount
echo Enabling Administrator Account...
net user administrator /active:yes
echo Administrator account enabled.
pause 
goto fix3

:SetAdminPassword
echo Setting Administrator Password...
net user administrator admin
echo Administrator password set to 'admin'.
pause goto fix3

:EnableRemoteDesktop
echo Enabling Remote Desktop for Administrator...
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes
echo Remote Desktop enabled.
pause 
goto fix3

:CreateUserScan
echo Creating user 'scan'...
net user scan /add
echo User 'scan' created.
pause 
goto fix3



:fix4
cls
echo -------------------------------------------------------------------
echo ---            --- * Outlook Fixed * ---                        ---
echo -------------------------------------------------------------------
echo [1] Outlook 2007 - 12.0 ost-pst 100gb
echo [2] Outlook 2007 - 12.0 ost-pst max
echo [3] Outlook 2010 - 14.0 ost-pst 100gb
echo [4] Outlook 2010 - 14.0 ost-pst max
echo [5] Outlook 2013 - 15.0 ost-pst 100gb
echo [6] Outlook 2013 - 15.0 ost-pst max
echo [7] Outlook 2016-2019-2021-365 - 16.0 ost-pst 100gb
echo [8] Outlook 2016-2019-2021-365 - 16.0 ost-pst max
echo [9] Outlook 2007 - 12.0 MaximumAttachmentSize
echo [10] Outlook 2010 - 14.0 MaximumAttachmentSize
echo [11] Outlook 2013 - 15.0 MaximumAttachmentSize
echo [12] Outlook 2016-2019-2021-365 - 16.0 MaximumAttachmentSize
echo -------------------------------------------------------------------
echo [0] Back Menu
echo -------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...) "

if "%choice%"=="0" goto fix_menu
if "%choice%"=="1" goto SetOutlook2007_100gb
if "%choice%"=="2" goto SetOutlook2007_Max
if "%choice%"=="3" goto SetOutlook2010_100gb
if "%choice%"=="4" goto SetOutlook2010_Max
if "%choice%"=="5" goto SetOutlook2013_100gb
if "%choice%"=="6" goto SetOutlook2013_Max
if "%choice%"=="7" goto SetOutlook2016_100gb
if "%choice%"=="8" goto SetOutlook2016_Max
if "%choice%"=="9" goto SetOutlook2007_MaxAttachment
if "%choice%"=="10" goto SetOutlook2010_MaxAttachment
if "%choice%"=="11" goto SetOutlook2013_MaxAttachment
if "%choice%"=="12" goto SetOutlook2016_MaxAttachment
goto fix4

:SetOutlook2007_100gb
echo Setting Outlook 2007 - 12.0 ost-pst 100gb...
reg add "HKCU\Software\Microsoft\Office\12.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\12.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\12.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\12.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f
echo Configuration for Outlook 2007 - 12.0 set to 100gb.
pause 
goto fix4

:SetOutlook2007_Max
echo Setting Outlook 2007 - 12.0 ost-pst max...
reg add "HKCU\Software\Microsoft\Office\12.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f
reg add "HKCU\Software\Microsoft\Office\12.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f
reg add "HKCU\Software\Microsoft\Office\12.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f
reg add "HKCU\Software\Microsoft\Office\12.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f
echo Configuration for Outlook 2007 - 12.0 set to max.
pause 
goto fix4

:SetOutlook2010_100gb
echo Setting Outlook 2010 - 14.0 ost-pst 100gb...
reg add "HKCU\Software\Microsoft\Office\14.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\14.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\14.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\14.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f
echo Configuration for Outlook 2010 - 14.0 set to 100gb.
pause 
goto fix4

:SetOutlook2010_Max
echo Setting Outlook 2010 - 14.0 ost-pst max...
reg add "HKCU\Software\Microsoft\Office\14.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f
reg add "HKCU\Software\Microsoft\Office\14.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f
reg add "HKCU\Software\Microsoft\Office\14.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f
reg add "HKCU\Software\Microsoft\Office\14.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f
echo Configuration for Outlook 2010 - 14.0 set to max.
pause 
goto fix4

:SetOutlook2013_100gb
echo Setting Outlook 2013 - 15.0 ost-pst 100gb...
reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f
echo Configuration for Outlook 2013 - 15.0 set to 100gb.
pause 
goto fix4

:SetOutlook2013_Max
echo Setting Outlook 2013 - 15.0 ost-pst max...
reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f
reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f
reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f
reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f
echo Configuration for Outlook 2013 - 15.0 set to max.
pause 
goto fix4

:SetOutlook2016_100gb
echo Setting Outlook 2016-2019-2021-365 - 16.0 ost-pst 100gb...
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f
echo Configuration for Outlook 2016-2019-2021-365 - 16.0 set to 100gb.
pause 
goto fix4

:SetOutlook2016_Max
echo Setting Outlook 2016-2019-2021-365 - 16.0 ost-pst max...
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f
echo Configuration for Outlook 2016-2019-2021-365 - 16.0 set to max.
pause 
goto fix4

:SetOutlook2007_MaxAttachment
echo Setting Outlook 2007 - 12.0 MaximumAttachmentSize...
reg add "HKCU\Software\Microsoft\Office\12.0\Outlook\Preferences" /v MaximumAttachmentSize /t REG_DWORD /d 198656 /f
echo MaximumAttachmentSize set for Outlook 2007 - 12.0.
pause 
goto fix4

:SetOutlook2010_MaxAttachment
echo Setting Outlook 2010 - 14.0 MaximumAttachmentSize...
reg add "HKCU\Software\Microsoft\Office\14.0\Outlook\Preferences" /v MaximumAttachmentSize /t REG_DWORD /d 198656 /f
echo MaximumAttachmentSize set for Outlook 2010 - 14.0.
pause 
goto fix4

:SetOutlook2013_MaxAttachment
echo Setting Outlook 2013 - 15.0 MaximumAttachmentSize...
reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\Preferences" /v MaximumAttachmentSize /t REG_DWORD /d 198656 /f
echo MaximumAttachmentSize set for Outlook 2013 - 15.0.
pause 
goto fix4

:SetOutlook2016_MaxAttachment
echo Setting Outlook 2016-2019-2021-365 - 16.0 MaximumAttachmentSize...
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\Preferences" /v MaximumAttachmentSize /t REG_DWORD /d 198656 /f
echo MaximumAttachmentSize set for Outlook 2016-2019-2021-365 - 16.0.
pause 
goto fix4





:fix5
cls
echo -------------------------------------------------------------------
echo                   Windows Update Settings Menu                   
echo -------------------------------------------------------------------
echo 1. Disable All Updates
echo 2. Enable Only Security Updates
echo 3. Enable All Updates
echo 4. Notify for Download and Install
echo 5. Automatic Download but Notify for Install
echo 6. Scheduled Install
echo -------------------------------------------------------------------
echo 0. Exit
echo -------------------------------------------------------------------
set /p choice=Choose an option (1-7):

if "%choice%"=="0" goto fix_menu
if "%choice%"=="1" goto disable_all_updates
if "%choice%"=="2" goto enable_security_updates
if "%choice%"=="3" goto enable_all_updates
if "%choice%"=="4" goto notify_for_download_and_install
if "%choice%"=="5" goto auto_download_but_notify
if "%choice%"=="6" goto scheduled_install


goto fix5

:disable_all_updates
cls
echo Disabling all updates...
:: Stop Windows Update service
sc stop wuauserv
:: Disable Windows Update service
sc config wuauserv start= disabled
echo All updates have been disabled.
pause
goto fix5

:enable_security_updates
cls
echo Enabling only security updates...
:: Enable Windows Update service
sc config wuauserv start= demand
:: Start Windows Update service
sc start wuauserv
:: Configure Windows Update to download only security updates
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "AutoUpdate" /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "AUOptions" /t REG_DWORD /d 3 /f
echo Only security updates have been enabled.
pause
goto fix5

:enable_all_updates
cls
echo Enabling all updates...
:: Enable Windows Update service
sc config wuauserv start= demand
:: Start Windows Update service
sc start wuauserv
:: Configure Windows Update to download all updates
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "AUOptions" /f
echo All updates have been enabled.
pause
goto fix5

:notify_for_download_and_install
cls
echo Setting updates to notify for download and install...
:: Enable Windows Update service
sc config wuauserv start= demand
:: Start Windows Update service
sc start wuauserv
:: Configure Windows Update to notify for download and install
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 2 /f
echo Updates are set to notify for download and install.
pause
goto fix5

:auto_download_but_notify
cls
echo Setting updates to automatically download but notify for install...
:: Enable Windows Update service
sc config wuauserv start= demand
:: Start Windows Update service
sc start wuauserv
:: Configure Windows Update to automatically download but notify for install
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 3 /f
echo Updates are set to automatically download but notify for install.
pause
goto fix5

:scheduled_install
cls
echo Setting updates to scheduled install...
:: Enable Windows Update service
sc config wuauserv start= demand
:: Start Windows Update service
sc start wuauserv
:: Configure Windows Update to scheduled install (example: Every day at 3 AM)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallDay" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallTime" /t REG_DWORD /d 3 /f
echo Updates are set to scheduled install at 3 AM every day.
pause
goto fix5



:fix6
cls
echo -------------------------------------------------------------------
echo                       Power Plan Settings Menu                   
echo -------------------------------------------------------------------
echo 1. Balanced
echo 2. High Performance
echo 3. Power Saver
echo 4. Ultimate Performance
echo 5. List Power Plans
echo -------------------------------------------------------------------
echo 0. Exit
echo -------------------------------------------------------------------

set /p choice="Select an option (1-6): "

if "%choice%"=="0" goto fix_menu
if "%choice%"=="1" goto set_balanced
if "%choice%"=="2" goto set_high_performance
if "%choice%"=="3" goto set_power_saver
if "%choice%"=="4" goto set_ultimate_performance
if "%choice%"=="5" goto list_power_plans


:set_balanced
cls
echo Checking if Balanced power plan already exists...
powercfg /list | findstr /i "Balanced" >nul
if %errorlevel%==0 (
    echo Balanced power plan exists. Activating it...
    powercfg /setactive SCHEME_BALANCED
) else (
    echo Balanced power plan does not exist. Creating it...
    powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
)

echo Re-enabling Fast Startup...
powercfg /h on

echo Adjusting power settings to default...
call :SetPowerSettings "Balanced"

echo Settings have been restored to default.
pause
goto fix6

:set_high_performance
cls
echo Checking if High Performance power plan exists...
for /f "tokens=2 delims=:" %%i in ('powercfg /list ^| findstr /i "High Performance"') do (
    set "found=%%i"
)

if defined found (
    echo High Performance power plan exists. Activating it...
    set "guid=%found:~1%"
    powercfg /setactive %guid%
) else (
    echo High Performance power plan does not exist. Creating it...
    powercfg /create "High Performance"
    for /f "tokens=2 delims=:" %%i in ('powercfg /list ^| findstr /i "High Performance"') do (
        set "found=%%i"
    )
    set "guid=%found:~1%"
    powercfg /setactive %guid%
)

echo Disabling Fast Startup...
powercfg /h off

echo Setting power management settings to "Never"...
call :SetPowerSettings "High Performance"

pause
goto fix6

:set_power_saver
cls
echo Checking if Power Saver power plan exists...
powercfg /list | findstr /i "Power Saver" >nul
if %errorlevel%==0 (
    echo Power Saver power plan exists. Activating it...
    powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
) else (
    echo Power Saver power plan does not exist. Creating it...
    powercfg /create "Power Saver" a1841308-3541-4fab-bc81-f71556f20b4a
    powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
)

echo Re-enabling Fast Startup...
powercfg /h on

echo Setting power management settings to default...
call :SetPowerSettings "Power Saver"

pause
goto fix6

:set_ultimate_performance
cls
set tempfile=%temp%\powercfg_output.txt
echo Listing power plans...
powercfg /list > %tempfile%

set "guid="
for /f "tokens=*" %%i in ('findstr /i "Ultimate Performance" %tempfile%') do (
    for /f "tokens=2 delims=:" %%j in ("%%i") do set "guid=%%j"
)

set "guid=%guid:~1%"

if "%guid%"=="" (
    echo Ultimate Performance power plan not found, creating a new one...
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    powercfg /list > %tempfile%
    for /f "tokens=*" %%i in ('findstr /i "Ultimate Performance" %tempfile%') do (
        for /f "tokens=2 delims=:" %%j in ("%%i") do set "guid=%%j"
    )
    set "guid=%guid:~1%"
)

if not "%guid%"=="" (
    echo Activating power plan with GUID: %guid%
    powercfg -setactive %guid%
) else (
    echo Power plan not found or could not be created.
)

del %tempfile%

echo Updating power settings...
call :SetPowerSettings "Ultimate Performance"

pause
goto fix6

:list_power_plans
cls
echo Listing all power plans...
powercfg /list
pause
goto fix6
