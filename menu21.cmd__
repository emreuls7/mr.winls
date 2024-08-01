@echo off
cls
:menu_21
cls
echo -------------------------------------------------------------------
echo --- menu_21    --- * Windows Fixed * ---      CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1]  System File Checker                                                                                           
echo [2]  DISM Scan Health                                                                                              
echo [3]  DISM Check Health                                                                                             
echo [4]  DISM Restore Health                                                                                           
echo [5]  Network Folder FIX                                                                                            
echo [6]  Group Policy Updates Forcing                                                                                  
echo [7]  Disable User Account Control                                                                                  
echo [8]  Enable User Account Control                                                                                   
echo [9]  Enable Administrator Account                                                                                  
echo [10] Administrator Password ( admin )                                                                              
echo [11] Enabling Remote Desktop for Administrator                                                                     
echo [12] Disabling 'Accounts: Limit local account use of blank passwords to console logon only                         
echo [13] User Creation ( scan )                                                                                        
echo [14] Enable SMB 1.0/CIFS File Sharing Support on Windows                                                           
echo [15] Turning off Windows Defender Firewall                                                                         
echo [16] Turning on Windows Defender Firewall                                                                          
echo [17] Enable Network Discovery                                                                                      
echo [18] Enabling "Launching applications and unsafe files" in Internet Options                                        
echo [19]                                                                                                               
echo [20]                                                                                                               
echo [21] Remove 'Open File - Security Warning' Prompt on Windows using                                                 
echo [22] Restore 'Open File - Security Warning' Prompt on Windows using                                                
echo [23] Windows Update Settings Disable All Updates                                                                   
echo [24] Windows Update Settings ***Enable Only Security Updates                                                       
echo [25] Windows Update Settings Enable All Updates                                                                    
echo [26] Windows Update Settings Notify for Download and Install                                                       
echo [27] Windows Update Settings ***Automatic Download but Notify for Install                                          
echo [28] Windows Update Settings Scheduled Install                                                                     
echo [29] Power Plan Balanced                                                                                           
echo [30] Power Plan High Performance                                                                                   
echo [31] Power Plan Power Saver                                                                                        
echo [32] Power Plan ***Ultimate Performance                                                                            
echo [33] Power Plan List                                                                                               
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" sfc /scannow
if "%choice%"=="2" DISM /Online /Cleanup-Image /ScanHealth
if "%choice%"=="3" DISM /Online /Cleanup-Image /CheckHealth
if "%choice%"=="4" DISM /Online /Cleanup-Image /RestoreHealth
if "%choice%"=="5" reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f
if "%choice%"=="6" gpupdate /force
if "%choice%"=="7" (
                    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
                    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
)
if "%choice%"=="8" (
                    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
                    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f
)
if "%choice%"=="9" net user administrator /active:yes
if "%choice%"=="10" net user administrator admin
if "%choice%"=="11" (

                      powershell -Command "Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0"
                      powershell -Command "Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'"
)
if "%choice%"=="12" powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'LimitBlankPasswordUse' -Value 0"
if "%choice%"=="13" net user scan /add
if "%choice%"=="14" dism.exe /online /enable-feature /featurename:"SMB1Protocol"
if "%choice%"=="15" netsh advfirewall set allprofiles state off
if "%choice%"=="16" netsh advfirewall set allprofiles state on
if "%choice%"=="17" (
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
)
if "%choice%"=="18" (
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v 1806 /t REG_DWORD /d 0 /f
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 1806 /t REG_DWORD /d 0 /f
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1806 /t REG_DWORD /d 0 /f
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1806 /t REG_DWORD /d 0 /f
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v 1806 /t REG_DWORD /d 0 /f
)
if "%choice%"=="19" 
if "%choice%"=="20" 
if "%choice%"=="21" reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v LowRiskFileTypes /t REG_SZ /d ".exe;.bat;.reg;.vbs;.js;.msi" /f
if "%choice%"=="22" reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v LowRiskFileTypes /f
if "%choice%"=="23" (
                      sc stop wuauserv
                      sc config wuauserv start= disabled
)
if "%choice%"=="24" (
                      sc config wuauserv start= demand
                      sc start wuauserv
                      reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "AutoUpdate" /t REG_DWORD /d 4 /f
                      reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "AUOptions" /t REG_DWORD /d 3 /f
)
if "%choice%"=="25" (
                      sc config wuauserv start= demand
                      sc start wuauserv
                      reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "AUOptions" /f
)
if "%choice%"=="26" (
                      sc config wuauserv start= demand
                      sc start wuauserv
                      reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 2 /f
)
if "%choice%"=="27" (
                      sc config wuauserv start= demand
                      sc start wuauserv
                      reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 3 /f
)
if "%choice%"=="28" (
                      sc config wuauserv start= demand
                      sc start wuauserv
                      reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 4 /f
                      reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallDay" /t REG_DWORD /d 0 /f
                      reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallTime" /t REG_DWORD /d 3 /f
)
if "%choice%"=="29" (
                      echo Checking if Balanced power plan already exists...
                      powercfg /list | findstr /i "Balanced" >nul

                      if %errorlevel%==0 (
                          echo Balanced power plan exists. Activating it...
                          powercfg /setactive SCHEME_BALANCED
                      ) else (
                          echo Balanced power plan does not exist. Creating it...
                          :: Normally, you don't need to create the Balanced plan as it's a default plan
                          :: The Balanced plan GUID is usually fixed, so use it directly
                          powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
                      )

                      echo Re-enabling Fast Startup...
                      :: Enable Fast Startup
                      powercfg /h on

                      echo Adjusting power settings to default...

                      :: Resetting power settings to default values
                      :: Power button and lid settings
                      powercfg -change -monitor-timeout-ac 10
                      powercfg -change -monitor-timeout-dc 5
                      powercfg -change -standby-timeout-ac 15
                      powercfg -change -standby-timeout-dc 10
                      powercfg -change -disk-timeout-ac 20
                      powercfg -change -disk-timeout-dc 10
                      powercfg /change hibernate-timeout-ac 30
                      powercfg /change hibernate-timeout-dc 15
)
if "%choice%"=="30" (
                      echo Checking if High Performance power plan already exists...
                      for /f "tokens=2 delims=:" %%i in ('powercfg /list ^| findstr /i "High Performance"') do (
                          set "found=%%i"
                      )

                      if defined found (
                          echo High Performance power plan exists. Activating it...
                          :: Remove leading spaces from the GUID
                          set "guid=%found:~1%"
                          echo Activating power plan with GUID: %guid%
                          :: Note: The following line must be run in the same command session where the variable is defined
                          call powercfg /setactive %guid%
                      ) else (
                          echo High Performance power plan does not exist. Creating it...
                          :: Create a new High Performance plan
                          powercfg /create "High Performance"
                          :: Get the GUID of the newly created power plan
                          for /f "tokens=2 delims=:" %%i in ('powercfg /list ^| findstr /i "High Performance"') do (
                              set "found=%%i"
                          )
                          :: Remove leading spaces from the GUID
                          set "guid=%found:~1%"
                          echo Activating newly created power plan with GUID: %guid%
                          :: Note: The following line must be run in the same command session where the variable is defined
                          call powercfg /setactive %guid%
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
)
if "%choice%"=="31" (
                      echo Checking if Power Saver power plan already exists...
                      powercfg /list | findstr /i "Power Saver" >nul

                      if %errorlevel%==0 (
                          echo Power Saver power plan exists. Activating it...
                          powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
                      ) else (
                          echo Power Saver power plan does not exist. Creating it...
                          :: Create Power Saver plan if it doesn't exist
                          powercfg /create "Power Saver" a1841308-3541-4fab-bc81-f71556f20b4a
                          powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
                      )


                      echo Re-enabling Fast Startup...
                      :: Enable Fast Startup
                      powercfg /h on

                      echo Setting power management settings to default...
                      powercfg /change monitor-timeout-ac 5
                      powercfg /change monitor-timeout-dc 2
                      powercfg /change standby-timeout-ac 10
                      powercfg /change standby-timeout-dc 5
                      powercfg /change disk-timeout-ac 15
                      powercfg /change disk-timeout-dc 10
                      powercfg /change hibernate-timeout-ac 30
                      powercfg /change hibernate-timeout-dc 15
)
if "%choice%"=="32" (
                      set tempfile=%temp%\powercfg_output.txt

                      :: Mevcut güç planlarını listeleyin ve geçici dosyaya kaydedin
                      echo Listing power plans...
                      powercfg /list > %tempfile%
                      type %tempfile%  :: Debugging: Bu satırı yorumdan çıkararak geçici dosyanın içeriğini görebilirsiniz

                      :: "Ultimate Performance" veya "Nihai Performans" planını arayın ve GUID'sini alın
                      set "guid="
                      for /f "tokens=*" %%i in ('findstr /i "Ultimate Performance" %tempfile%') do (
                          echo Found line: %%i
                          for /f "tokens=2 delims=:" %%j in ("%%i") do set "guid=%%j"
                      )

                      :: GUID'nin başındaki boşlukları temizleyin
                      set "guid=%guid:~1%"

                      :: Eğer "Ultimate Performance" planı bulunamadıysa, yeni bir tane oluşturun
                      if "%guid%"=="" (
                          echo Ultimate Performance power plan not found, creating a new one...
                          powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
                          powercfg /list > %tempfile%
                          type %tempfile%  :: Debugging: Bu satırı yorumdan çıkararak geçici dosyanın içeriğini tekrar görebilirsiniz
                          for /f "tokens=*" %%i in ('findstr /i "Ultimate Performance" %tempfile%') do (
                          for /f "tokens=2 delims=:" %%j in ("%%i") do set "guid=%%j"
                          )
                          :: GUID'nin başındaki boşlukları tekrar temizleyin
                          set "guid=%guid:~1%"
                      )

                      :: Eğer GUID bulunduysa, bu güç planını aktif hale getirin
                      if not "%guid%"=="" (
                          echo Activating power plan with GUID: %guid%
                          powercfg -setactive %guid%
                      ) else (
                          echo Power plan not found or could not be created.
                      )

                      :: Geçici dosyayı silin
                      del %tempfile%

                      :: Diğer güç ayarlarını yapılandırın
                      echo Updating power settings...
                      powercfg /h off
                      powercfg /change monitor-timeout-ac 0
                      powercfg /change monitor-timeout-dc 0
                      powercfg /change standby-timeout-ac 0
                      powercfg /change standby-timeout-dc 0
                      powercfg /change disk-timeout-ac 0
                      powercfg /change disk-timeout-dc 0
                      powercfg /change hibernate-timeout-ac 0
                      powercfg /change hibernate-timeout-dc 0
)
if "%choice%"=="33" powercfg /list
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
pasue
goto menu_21
::---------------------------------------------------------------------------------------------------------------------------
