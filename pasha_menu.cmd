@echo off
:ShowMenu
cls
echo -------------------------------------------------------------------
echo ---                  --- PASHA LEFKOSA ---                      ---
echo -------------------------------------------------------------------
echo [1] TIGER3 LOGO
echo [2] MC FIDELIO
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
set /p choice=Enter your choice (0,1,2...): 

if "%choice%"=="0" exit
if "%choice%"=="1" goto tiger3logo
if "%choice%"=="2" goto mcfid

goto ShowMenu

:tiger3logo
cls
:TigerInstall
cls

echo ---    Pasha Lefkosa Tiger3 Install          ---

echo [1] Windows Credentials 192.168.13.3 add
echo [2] Tiger3 PASHA Copy C
echo [3] Tiger3 2015-2019 Copy C
echo [4] Tiger3 2019 Copy C
echo [5] Tiger3 2022 Copy C

echo [6] Windows Credentials 192.168.48.4 add
echo [7] Tiger3 AKUN Copy C

echo [11] License Tiger3 PASHA
echo [12] License Tiger3 2015-2019
echo [13] License Tiger3 2019
echo [14] License Tiger3 2022

echo [15] License Tiger3 AKUN

echo [21] LHOSVR Windows host

echo [0] Exit


set /p choice=Enter your choice (0,1,2,3...): 

if "%choice%"=="0" :ShowMenu
if "%choice%"=="1" goto :CmdKeyAdd192_168_13_3
if "%choice%"=="2" goto :CopyTiger3Pasha
if "%choice%"=="3" goto :CopyTiger3_2015_2019
if "%choice%"=="4" goto :CopyTiger3_2019
if "%choice%"=="5" goto :CopyTiger3_2022
if "%choice%"=="6" goto :CmdKeyAdd192_168_48_4
if "%choice%"=="7" goto :CopyTiger3Akun
if "%choice%"=="11" goto :LicenseTiger3Pasha
if "%choice%"=="12" goto :LicenseTiger3_2015_2019
if "%choice%"=="13" goto :LicenseTiger3_2019
if "%choice%"=="14" goto :LicenseTiger3_2022
if "%choice%"=="15" goto :LicenseTiger3Akun
if "%choice%"=="21" goto :RunLhosvr

echo Invalid choice. Please select a valid option.
timeout /t 2 /nobreak >nul
goto :TigerInstall

:CmdKeyAdd192_168_13_3
cmdkey /add:192.168.13.3 /user:grandpasha /pass:grand2013
echo Windows Credentials for 192.168.13.3 added.
goto :End

:CmdKeyAdd192_168_48_4
cmdkey /add:192.168.48.4 /user:grandpasha /pass:grand2013
echo Windows Credentials for 192.168.48.4 added.
goto :End

:CopyTiger3Pasha
robocopy "\\192.168.13.3\tiger3_share\TIGER3_PASHA" "C:\TIGER3\TIGER3_PASHA" /E /IS
echo Tiger3 PASHA files copied to C:\TIGER3\TIGER3_PASHA.
goto :End

:CopyTiger3_2015_2019
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2015-2019" "C:\TIGER3\TIGER3_2015-2019" /E /IS
echo Tiger3 2015-2019 files copied to C:\TIGER3\TIGER3_2015-2019.
goto :End

:CopyTiger3_2019
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2019" "C:\TIGER3\TIGER3_2019" /E /IS
echo Tiger3 2019 files copied to C:\TIGER3\TIGER3_2019.
goto :End

:CopyTiger3_2022
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2022" "C:\TIGER3\TIGER3_2022" /E /IS
echo Tiger3 2022 files copied to C:\TIGER3\TIGER3_2022.
goto :End

:CopyTiger3Akun
robocopy "\\192.168.48.4\tiger3_share\TIGER3_AKUN" "C:\TIGER3\TIGER3_AKUN" /E /IS
echo Tiger3 AKUN files copied to C:\TIGER3\TIGER3_AKUN.
goto :End

:LicenseTiger3Pasha
robocopy "\\192.168.13.3\tiger3_share\TIGER3_PASHA" "C:\TIGER3\TIGER3_PASHA" License.Dat /IS
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
goto :End

:LicenseTiger3_2015_2019
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2015-2019" "C:\TIGER3\TIGER3_2015-2019" License.Dat /IS
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
goto :End

:LicenseTiger3_2019
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2019" "C:\TIGER3\TIGER3_2019" License.Dat /IS
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
goto :End

:LicenseTiger3_2022
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2022" "C:\TIGER3\TIGER3_2022" License.Dat /IS
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
goto :End

:LicenseTiger3Akun
robocopy "\\192.168.48.4\tiger3_share\TIGER3_AKUN" "C:\TIGER3\TIGER3_AKUN" License.Dat /IS
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
goto :End

:RunLhosvr
start "" "\\192.168.13.3\tiger3_share\License\TIGER3_HOST"
goto :End

:Exit
echo Exiting program. Goodbye!
exit /b

:End
timeout /t 3 /nobreak >nul
goto :TigerInstall

:mcfid
@echo off
setlocal enabledelayedexpansion

:MdfidInstall
cls
echo -------------------------------------------------------------------
echo ---               Welcome Protel MC + Fidelio Install           ---
echo -------------------------------------------------------------------
echo [1] Windows Credentials 192.168.18.8 add
echo [2] Oracle Setup + Admin Copy
echo [3] MC Setup (Materials Control)
echo [4] Fidelio Setup
echo [5] Fidelio V8 Client Short Cut Setup
echo [6] IFC Setup
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "

if "%choice%"=="0" :ShowMenu
if "%choice%"=="1" goto add_windows_credentials
if "%choice%"=="2" goto oracle_setup
if "%choice%"=="3" goto mc_setup
if "%choice%"=="4" goto fidelio_setup
if "%choice%"=="5" goto fidelio_shortcut
if "%choice%"=="6" goto ifc_setup


echo Invalid choice. Please enter a number between 0 and 6.
timeout /t 2 /nobreak >nul
goto MdfidInstall

:add_windows_credentials
cls
echo Adding Windows Credentials...
cmdkey /add:192.168.18.8 /user:it /pass:C3kss181
if %errorlevel% neq 0 (
    echo Failed to add credentials.
    timeout /t 2 /nobreak >nul
)
goto MdfidInstall

:oracle_setup
cls
echo Starting Oracle Setup...
start /wait "" "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\1-Oracle - setup\client 11204\setup.exe"
if %errorlevel% neq 0 (
    echo Oracle setup failed.
    timeout /t 2 /nobreak >nul
    goto MdfidInstall
)
pause
echo Copying Oracle files...
robocopy "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\2-Oracle Admin - copypast\Oracle" "C:\Oracle" /E /IS
if %errorlevel% neq 0 (
    echo Failed to copy Oracle files.
    timeout /t 2 /nobreak >nul
)
goto MdfidInstall

:mc_setup
cls
echo Starting .NET Framework Setup...
start /wait "" "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\3-MC - setup\dotNetFx35setup.exe"
if %errorlevel% neq 0 (
    echo .NET setup failed.
    timeout /t 2 /nobreak >nul
    goto MdfidInstall
)
pause
cls
echo MC Setup Information
echo ---------------------
echo pass: Mymicros1!
echo svr: MC
echo ---------------------
echo Starting MC Setup...
start /wait "" "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\3-MC - setup\1-18.1.8.0\setup.exe"
if %errorlevel% neq 0 (
    echo MC setup failed.
    timeout /t 2 /nobreak >nul
    goto MdfidInstall
)
pause
echo Copying MC files...
robocopy "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\3-MC - setup\2-Sqlcopy" "C:\Program Files (x86)\Materials Control" /E /IS
if %errorlevel% neq 0 (
    echo Failed to copy MC files.
    timeout /t 2 /nobreak >nul
    goto MdfidInstall
)
echo Updating Permissions...
icacls "C:\Program Files (x86)\Materials Control" /grant "Authenticated Users:(OI)(CI)(M)"
icacls "C:\ProgramData\Microsoft\Crypto\RSA\MachineKeys" /grant "Authenticated Users:(OI)(CI)(M)"
if %errorlevel% neq 0 (
    echo Failed to update permissions.
    timeout /t 2 /nobreak >nul
)
goto MdfidInstall

:fidelio_setup
cls
echo Fidelio Setup Information
echo -------------------------------------------------------------------
echo nls_lang: TURKISH_TURKEY.TR8MSWIN1254
echo -------------------------------------------------------------------
echo V8LIVE
echo LIVE
echo V8
echo -------------------------------------------------------------------
echo V8TRAIN
echo TRAIN
echo V8
echo -------------------------------------------------------------------
start /wait "" "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\4-Fidelio - setup\8.13.0.0 Full\setup.exe"
if %errorlevel% neq 0 (
    echo Fidelio setup failed.
    timeout /t 2 /nobreak >nul
    goto MdfidInstall
)
pause
echo Copying Fidelio files...
robocopy "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\5-Fidelio - copypast\8.13.2.0" "C:\FIDELIO" /E /IS
if %errorlevel% neq 0 (
    echo Failed to copy Fidelio files.
    timeout /t 2 /nobreak >nul
)

# del "C:\Users\Public\Desktop\Thunderbird.lnk"
# del "C:\Users\Public\Desktop\Thunderbird.lnk"
goto MdfidInstall

:fidelio_shortcut
cls
echo Installing Fidelio V8 Client Shortcut...
start /wait "" "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\6-V8-Client-Short-Cut -setup\V8-Client-Short-Cut.exe"
if %errorlevel% neq 0 (
    echo Fidelio V8 Client Shortcut setup failed.
    timeout /t 2 /nobreak >nul
)
goto MdfidInstall

:ifc_setup
cls
echo Starting IFC Setup...
start /wait "" "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\7-IFC - setup\IFC8.13.exe"
if %errorlevel% neq 0 (
    echo IFC setup failed.
    timeout /t 2 /nobreak >nul
)
goto MdfidInstall

