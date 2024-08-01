@echo off
cls
:menu_03
cls
echo -------------------------------------------------------------------
echo --- menu_03     --- Winget 2 Install ---      CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1] CPUID CPU-Z MSI
echo [2] MSI Afterburner
echo [3] ASUS ArmouryCrate
echo [4] CPUID ROG CPU-Z
echo [5] Wireshark
echo [6] Keeper Password Manager
echo [7] NVIDIA GeForce NOW
echo [8] NVIDIA PhysX System Software 
echo [9] NVIDIA Broadcast 
echo [10] NVIDIA CUDA Toolkit
echo [11] spacedesk Windows DRIVER
echo [12] spacedesk Windows VIEWER
echo ----------------------------------------------------------
echo [0] Exit                                                   
echo ----------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" winget install CPUID.CPU-Z.MSI -e
if "%choice%"=="2" winget install Guru3D.Afterburner -e
if "%choice%"=="3" winget install Asus.ArmouryCrate
if "%choice%"=="4" winget install CPUID.CPU-Z.ROG
if "%choice%"=="5" winget install WiresharkFoundation.Wireshark -e
if "%choice%"=="6" winget install Keeper.KeeperDesktop -e
if "%choice%"=="7" winget install Nvidia.GeForceNow -e
if "%choice%"=="8" winget install Nvidia.PhysX -e
if "%choice%"=="9" winget install Nvidia.Broadcast -e
if "%choice%"=="10" winget install Nvidia.CUDA -e
if "%choice%"=="11" winget install Datronicsoft.SpacedeskDriver.Server-e
if "%choice%"=="12" winget install Datronicsoft.SpacedeskDriver.Client -e
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
::pause
goto menu_03
::---------------------------------------------------------------------------------------------------------------------------
