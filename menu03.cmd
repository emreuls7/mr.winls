@echo off
cls
:menu3
cls
echo ------------------------------------------------------------------------------------------------------------------------
echo --- Menu3                               --- Security Installer ---                                 CREATED BY MRLSx7 ---
echo ------------------------------------------------------------------------------------------------------------------------
echo [1] Malwarebytes                                                                                                   
echo [2] Telerik Fiddler Classic                                                                                        
echo [3] GlassWire                                                                                                      
echo [4] Wireshark                                                                                                      
echo [5] Keeper Password Manager                                                                                        
echo ------------------------------------------------------------------------------------------------------------------------
echo [0] Exit
echo ------------------------------------------------------------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" winget install Malwarebytes.Malwarebytes -e
if "%choice%"=="2" winget install Telerik.Fiddler.Classic -e
if "%choice%"=="3" winget install GlassWire.GlassWire -e
if "%choice%"=="4" winget install WiresharkFoundation.Wireshark -e
if "%choice%"=="5" winget install Keeper.KeeperDesktop -e
::if "%choice%"=="6" goto install_programC6
::if "%choice%"=="7" goto install_programC7
::if "%choice%"=="8" goto install_programC8
::if "%choice%"=="9" goto install_programC9
::if "%choice%"=="10" goto install_programC10
::if "%choice%"=="11" goto install_programC11
::if "%choice%"=="12" goto install_programC12
::if "%choice%"=="13" goto install_programC13
::if "%choice%"=="14" goto install_programC14
::if "%choice%"=="15" goto install_programC15
::if "%choice%"=="16" goto install_programC16
::if "%choice%"=="17" goto install_programC17
::if "%choice%"=="18" goto install_programC18
::if "%choice%"=="19" goto install_programC19
::if "%choice%"=="20" goto install_programC20
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
