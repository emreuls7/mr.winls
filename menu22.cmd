@echo off
cls
:menu22
cls
echo -------------------------------------------------------------------
echo --- menu_21    --- * Outlook Fixed * ---      CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [.1.]  Outlook 2007 - 12.0 ost-pst 100gb                                                                             
echo [.2.]  Outlook 2007 - 12.0 ost-pst max                                                                               
echo [.3.]  Outlook 2010 - 14.0 ost-pst 100gb                                                                             
echo [.4.]  Outlook 2010 - 14.0 ost-pst max                                                                               
echo [.5.]  Outlook 2013 - 15.0 ost-pst 100gb                                                                             
echo [.6.]  Outlook 2013 - 15.0 ost-pst max                                                                               
echo [.7.]  Outlook 2016-2019-2021-365 - 16.0 ost-pst 100gb                                                               
echo [.8.]  Outlook 2016-2019-2021-365 - 16.0 ost-pst max                                                                 
echo [.9.]  Outlook 2007 - 12.0 MaximumAttachmentSize                                                                     
echo [.10.] Outlook 2010 - 14.0 MaximumAttachmentSize                                                                     
echo [.11.] Outlook 2013 - 15.0 MaximumAttachmentSize                                                                     
echo [.12.] Outlook 2016-2019-2021-365 - 16.0 MaximumAttachmentSize                                                       
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" goto install_programW1
if "%choice%"=="2" goto install_programW2
if "%choice%"=="3" goto install_programW3
if "%choice%"=="4" goto install_programW4
if "%choice%"=="5" goto install_programW5
if "%choice%"=="6" goto install_programW6
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" goto main_menu
::---------------------------------------------------------------------------------------------------------------------------
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW1
cls
rem Setting WarmLargeFileSize for PST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting MaxLargeFileSize for PST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting WarmLargeFileSize for OST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting MaxLargeFileSize for OST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW2
cls

rem Setting WarmLargeFileSize for PST files (decimal equivalent of f3cf3cf2: 4080214766)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f

rem Setting MaxLargeFileSize for PST files (decimal equivalent of ffffffff: 4294967295)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f

rem Setting WarmLargeFileSize for OST files (decimal equivalent of f3cf3cf2: 4080214766)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f

rem Setting MaxLargeFileSize for OST files (decimal equivalent of ffffffff: 4294967295)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW3
cls

rem Setting WarmLargeFileSize for PST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting MaxLargeFileSize for PST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting WarmLargeFileSize for OST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting MaxLargeFileSize for OST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW4
cls

rem Setting WarmLargeFileSize for PST files (decimal equivalent of f3cf3cf2: 4080214766)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f

rem Setting MaxLargeFileSize for PST files (decimal equivalent of ffffffff: 4294967295)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f

rem Setting WarmLargeFileSize for OST files (decimal equivalent of f3cf3cf2: 4080214766)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f

rem Setting MaxLargeFileSize for OST files (decimal equivalent of ffffffff: 4294967295)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW5
cls

rem Setting WarmLargeFileSize for PST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting MaxLargeFileSize for PST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting WarmLargeFileSize for OST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting MaxLargeFileSize for OST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW6
cls

rem Setting WarmLargeFileSize for PST files (decimal equivalent of f3cf3cf2: 4080214766)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f

rem Setting MaxLargeFileSize for PST files (decimal equivalent of ffffffff: 4294967295)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f

rem Setting WarmLargeFileSize for OST files (decimal equivalent of f3cf3cf2: 4080214766)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f

rem Setting MaxLargeFileSize for OST files (decimal equivalent of ffffffff: 4294967295)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW7
cls

rem Setting WarmLargeFileSize for PST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting MaxLargeFileSize for PST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting WarmLargeFileSize for OST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 6144 /f

rem Setting MaxLargeFileSize for OST files (decimal equivalent of 00017c00: 6144)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 6144 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW8
cls

rem Setting WarmLargeFileSize for PST files (decimal equivalent of f3cf3cf2: 4080214766)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\PST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f

rem Setting MaxLargeFileSize for PST files (decimal equivalent of ffffffff: 4294967295)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\PST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f

rem Setting WarmLargeFileSize for OST files (decimal equivalent of f3cf3cf2: 4080214766)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\OST" /v WarmLargeFileSize /t REG_DWORD /d 4080214766 /f

rem Setting MaxLargeFileSize for OST files (decimal equivalent of ffffffff: 4294967295)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\OST" /v MaxLargeFileSize /t REG_DWORD /d 4294967295 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW9
cls

rem Setting MaximumAttachmentSize for Outlook Preferences (decimal equivalent of 00030720: 198656)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\Preferences" /v MaximumAttachmentSize /t REG_DWORD /d 198656 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW10
cls

rem Setting MaximumAttachmentSize for Outlook Preferences (decimal equivalent of 00030720: 198656)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\Preferences" /v MaximumAttachmentSize /t REG_DWORD /d 198656 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW11
cls

rem Setting MaximumAttachmentSize for Outlook Preferences (decimal equivalent of 00030720: 198656)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\Preferences" /v MaximumAttachmentSize /t REG_DWORD /d 198656 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
:install_programW12
cls

rem Setting MaximumAttachmentSize for Outlook Preferences (decimal equivalent of 00030720: 198656)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Preferences" /v MaximumAttachmentSize /t REG_DWORD /d 198656 /f

pause
goto menu22
::---------------------------------------------------------------------------------------------------------------------------
