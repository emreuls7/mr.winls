@echo off
cls
:menu_21_3
cls
echo -------------------------------------------------------------------
echo --- menu_21    --- * Windows Fixed * ---      CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1] Disabling 'Accounts: Limit local account use of blank passwords to console logon only
echo [2] Enabling "Launching applications and unsafe files" in Internet Options
echo [3] Enable Administrator Account
echo [4] Administrator Password ( admin )
echo [5] Enabling Remote Desktop for Administrator
echo [6] User Creation ( scan )
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'LimitBlankPasswordUse' -Value 0"
if "%choice%"=="2" (
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v 1806 /t REG_DWORD /d 0 /f
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 1806 /t REG_DWORD /d 0 /f
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1806 /t REG_DWORD /d 0 /f
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1806 /t REG_DWORD /d 0 /f
                      reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v 1806 /t REG_DWORD /d 0 /f
)
if "%choice%"=="3" net user administrator /active:yes
if "%choice%"=="4" net user administrator admin
if "%choice%"=="5" (

                      powershell -Command "Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0"
                      powershell -Command "Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'"
)
if "%choice%"=="6" net user scan /add
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
pasue
goto menu_21_3
::---------------------------------------------------------------------------------------------------------------------------
