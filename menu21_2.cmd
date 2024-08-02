@echo off
cls
:menu_21_2
cls
echo -------------------------------------------------------------------
echo --- menu_21_2   --- * Windows Fixed * ---                       ---
echo -------------------------------------------------------------------
echo [1] Disable User Account Control
echo [2] Enable User Account Control
echo [3] Turning off Windows Defender Firewall
echo [4] Turning on Windows Defender Firewall
echo [5] Network Folder FIX
echo [6] Enable Network Discovery
echo [7] Remove 'Open File - Security Warning' Prompt on Windows using                                                 
echo [8] Restore 'Open File - Security Warning' Prompt on Windows using
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------

:: Define temporary directory
set "tempDir=C:\Windows\Temp"

if "%choice%"=="1" (
                    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
                    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
)
if "%choice%"=="2" (
                    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
                    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f
)
if "%choice%"=="3" netsh advfirewall set allprofiles state off
if "%choice%"=="4" netsh advfirewall set allprofiles state on
if "%choice%"=="5" reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f
if "%choice%"=="6" (
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
if "%choice%"=="7" reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v LowRiskFileTypes /t REG_SZ /d ".exe;.bat;.reg;.vbs;.js;.msi" /f
if "%choice%"=="8" reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v LowRiskFileTypes /f
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" (
    powershell -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21.cmd -OutFile '%tempDir%\menu21.cmd'"
    call "%tempDir%\menu21.cmd"
    del "%tempDir%\menu21.cmd"
)
::---------------------------------------------------------------------------------------------------------------------------
pasue
goto menu_21_2
::---------------------------------------------------------------------------------------------------------------------------
