@echo off
cls
:menu_mcfid
cls
echo ------------------------------------------------
echo --- Welcome Protel MC + Fidelio Install      ---
echo ------------------------------------------------
echo [1] Windows Credentials 192.168.18.8 add
echo [2] Oracle Setup + Admin Copy
echo [3] MC Setup ( Materials Control )
echo [4] Fidelio Setup
echo [5] Fidelio V8 Client Short Cut Setup
echo [6] IFC Setup
echo ------------------------------------------------
echo [0] Exit
echo ------------------------------------------------
::------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" goto windows_credentials
if "%choice%"=="2" goto oracle_setup
if "%choice%"=="3" goto mc_setup
if "%choice%"=="4" goto fidelio_setup
if "%choice%"=="5" goto fidelio_shortcut
if "%choice%"=="6" goto ifc_setup
if "%choice%"=="0" goto exit_script

:windows_credentials
cls
echo ------------------------------------------------
cmdkey /add:192.168.18.8 /user:it /pass:C3kss181
if errorlevel 1 (
    echo Failed to add credentials.
    pause
    goto menu_mcfid
)
echo ------------------------------------------------
timeout 2
goto menu_mcfid

:oracle_setup
cls
echo ------------------------------------------------
echo start
echo ------------------------------------------------
"\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\1-Oracle - setup\client 11204\setup.exe"
if errorlevel 1 (
    echo Oracle setup failed.
    pause
    goto menu_mcfid
)
echo ------------------------------------------------
pause
timeout 2
cls
echo ------------------------------------------------
echo copy
echo ------------------------------------------------
robocopy "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\2-Oracle Admin - copypast\Oracle" "C:\Oracle" /E /IS
if errorlevel 1 (
    echo Failed to copy Oracle files.
    pause
    goto menu_mcfid
)
echo ------------------------------------------------
timeout 2
goto menu_mcfid

:mc_setup
cls
echo ------------------------------------------------
"\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\3-MC - setup\dotNetFx35setup.exe"
if errorlevel 1 (
    echo .NET setup failed.
    pause
    goto menu_mcfid
)
echo ------------------------------------------------
cls
echo ------------------------------------------------
echo -
echo pass:	Mymicros1!		
echo svr:	MC
echo -
echo ------------------------------------------------
echo start
echo ------------------------------------------------
"\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\3-MC - setup\1-18.1.8.0\setup.exe"
if errorlevel 1 (
    echo MC setup failed.
    pause
    goto menu_mcfid
)
echo ------------------------------------------------
pause
timeout 2
cls
echo ------------------------------------------------
echo copy
echo ------------------------------------------------
robocopy "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\3-MC - setup\2-Sqlcopy" "C:\Program Files (x86)\Materials Control" /E /IS
if errorlevel 1 (
    echo Failed to copy MC files.
    pause
    goto menu_mcfid
)
echo ------------------------------------------------
pause
timeout 2
cls
echo ------------------------------------------------
echo Authenticated Users add
echo ------------------------------------------------
icacls "C:\Program Files (x86)\Materials Control" /grant "Authenticated Users:(OI)(CI)(M)"
icacls "C:\ProgramData\Microsoft\Crypto\RSA\MachineKeys" /grant "Authenticated Users:(OI)(CI)(M)"
if errorlevel 1 (
    echo Failed to update permissions.
    pause
    goto menu_mcfid
)
goto menu_mcfid

:fidelio_setup
cls
echo ------------------------------------------------
echo nls_lang: TURKISH_TURKEY.TR8MSWIN1254
echo -
echo V8LIVE
echo LIVE
echo V8
echo -
echo V8TRAIN
echo TRAIN
echo V8
echo -
start /wait "" "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\4-Fidelio - setup\8.13.0.0 Full\setup.exe"
if errorlevel 1 (
    echo Fidelio setup failed.
    pause
    goto menu_mcfid
)
pause
timeout 2
cls
echo copy
robocopy "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\5-Fidelio - copypast\8.13.2.0" "C:\FIDELIO" /E /IS
if errorlevel 1 (
    echo Failed to copy Fidelio files.
    pause
    goto menu_mcfid
)
goto menu_mcfid

:fidelio_shortcut
cls
echo ------------------------------------------------
echo V8LIVE
echo LIVE
echo V8
echo -
echo V8TRAIN
echo TRAIN
echo V8
echo -
start /wait "" "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\6-V8-Client-Short-Cut -setup\V8-Client-Short-Cut.exe"
if errorlevel 1 (
    echo Fidelio V8 Client Shortcut setup failed.
    pause
    goto menu_mcfid
)
goto menu_mcfid

:ifc_setup
cls
echo ------------------------------------------------
start /wait "" "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\7-IFC - setup\IFC8.13.exe"
if errorlevel 1 (
    echo IFC setup failed.
    pause
    goto menu_mcfid
)
goto menu_mcfid

:exit_script
echo .
echo .
echo ------------------------------------------------
echo BUDA BITTI DEMEK HADI GORUSURUK ...
echo ------------------------------------------------
timeout 3
exit
