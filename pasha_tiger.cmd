@echo off
cls

:menu_logo
cls
echo ------------------------------------------------
echo ---    Pasha Lefkosa Tiger3 Install          ---
echo ------------------------------------------------
echo [1] Windows Credentials 192.168.13.3 add
echo [2] Tiger3 PASHA Copy C
echo [3] Tiger3 2015-2019 Copy C
echo [4] Tiger3 2019 Copy C
echo [5] Tiger3 2022 Copy C
echo ------------------------------------------------
echo [6] Windows Credentials 192.168.48.4 add
echo [7] Tiger3 AKUN Copy C
echo ------------------------------------------------
echo [11] License Tiger3 PASHA
echo [12] License Tiger3 2015-2019
echo [13] License Tiger3 2019
echo [14] License Tiger3 2022
echo ------------------------------------------------
echo [15] License Tiger3 AKUN
echo ------------------------------------------------
echo [21] LHOSVR Windows host
echo ------------------------------------------------
echo [0] Exit
echo ------------------------------------------------

:: Get user input
set /p choice="Enter your choice (0,1,2,3...): "

:: Handle user choice
if "%choice%"=="1" goto cmdkey
if "%choice%"=="2" goto copy_pasha
if "%choice%"=="3" goto copy_2015_2019
if "%choice%"=="4" goto copy_2019
if "%choice%"=="5" goto copy_2022
if "%choice%"=="6" goto credential_192_168_48_4
if "%choice%"=="7" goto copy_akun
if "%choice%"=="11" goto license_pasha
if "%choice%"=="12" goto license_2015_2019
if "%choice%"=="13" goto license_2019
if "%choice%"=="14" goto license_2022
if "%choice%"=="15" goto license_akun
if "%choice%"=="21" goto lhosvr
if "%choice%"=="0" goto exit_script

:: Handle invalid choices
echo Invalid choice. Please select a valid option.
pause
goto menu_logo

:cmdkey
cls
echo ------------------------------------------------
cmdkey /add:192.168.13.3 /user:grandpasha /pass:grand2013
echo Windows Credentials for 192.168.13.3 added.
pause
goto menu_logo

:copy_pasha
cls
echo ------------------------------------------------
robocopy "\\192.168.13.3\tiger3_share\TIGER3_PASHA" "C:\TIGER3\TIGER3_PASHA" /E /IS
echo Tiger3 PASHA files copied to C:\TIGER3\TIGER3_PASHA.
pause
goto menu_logo

:copy_2015_2019
cls
echo ------------------------------------------------
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2015-2019" "C:\TIGER3\TIGER3_2015-2019" /E /IS
echo Tiger3 2015-2019 files copied to C:\TIGER3\TIGER3_2015-2019.
pause
goto menu_logo

:copy_2019
cls
echo ------------------------------------------------
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2019" "C:\TIGER3\TIGER3_2019" /E /IS
echo Tiger3 2019 files copied to C:\TIGER3\TIGER3_2019.
pause
goto menu_logo

:copy_2022
cls
echo ------------------------------------------------
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2022" "C:\TIGER3\TIGER3_2022" /E /IS
echo Tiger3 2022 files copied to C:\TIGER3\TIGER3_2022.
pause
goto menu_logo

:credential_192_168_48_4
cls
echo ------------------------------------------------
cmdkey /add:192.168.48.4 /user:grandpasha /pass:grand2013
echo Windows Credentials for 192.168.48.4 added.
pause
goto menu_logo

:copy_akun
cls
echo ------------------------------------------------
robocopy "\\192.168.48.4\tiger3_share\TIGER3_AKUN" "C:\TIGER3\TIGER3_AKUN" /E /IS
echo Tiger3 AKUN files copied to C:\TIGER3\TIGER3_AKUN.
pause
goto menu_logo

:license_pasha
cls
echo ------------------------------------------------
robocopy "\\192.168.13.3\tiger3_share\TIGER3_PASHA" "C:\TIGER3\TIGER3_PASHA" License.Dat /IS
echo 
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
pause
goto menu_logo

:license_2015_2019
cls
echo ------------------------------------------------
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2015-2019" "C:\TIGER3\TIGER3_2015-2019" License.Dat /IS
echo 
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
pause
goto menu_logo

:license_2019
cls
echo ------------------------------------------------
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2019" "C:\TIGER3\TIGER3_2019" License.Dat /IS
echo 
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
pause
goto menu_logo

:license_2022
cls
echo ------------------------------------------------
robocopy "\\192.168.13.3\tiger3_share\TIGER3_2022" "C:\TIGER3\TIGER3_2022" License.Dat /IS
echo 
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
pause
goto menu_logo

:license_akun
cls
echo ------------------------------------------------
robocopy "\\192.168.48.4\tiger3_share\TIGER3_AKUN" "C:\TIGER3\TIGER3_AKUN" License.Dat /IS
echo 
echo *AFFERIM LISANSI YAPTIN TEBRIK EDRIM ...
pause
goto menu_logo

:lhosvr
cls
echo ------------------------------------------------
start /wait "" "\\192.168.13.3\muhasebe\License\TIGER3_HOST"
pause
goto menu_logo

:exit_script
cls
echo ------------------------------------------------
echo ---    BYE                                   ---
echo ------------------------------------------------
timeout /t 3 /nobreak >nul
exit
