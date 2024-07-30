@echo off
cls
:menu7
cls
echo --------------------------------------------------------------
echo --- Menu7 --- VPN + Remote Installer --- CREATED BY MRLSx7 ---
echo --------------------------------------------------------------
echo [1]  FortiClient VPN
echo [2]  Windscribe VPN
echo [3]  ExpressVPN
echo [4]  NordVPN
echo [5]  ProtonVPN
echo [6]  Radmin VPN
echo [7]  OpenVPN
echo [8]  OpenVPN Connect
echo [9]  WireGuard VPN                                                                                                 
echo [10] Mullvad VPN
echo [11] UltraVNC
echo [12] RealVNC Viewer
echo [13] RealVNC Server
echo [14] AnyDesk
echo [15] TeamViewer
echo [16] Chrome Remote Desktop Host
echo --------------------------------------------------------------
echo [21] mRemoteNG                                                                                                     
echo [22] 1Remote                                                                                                       
echo --------------------------------------------------------------
echo [0] Exit
echo --------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" winget install Fortinet.FortiClientVPN -e
if "%choice%"=="2" winget install Windscribe.Windscribe -e
if "%choice%"=="3" winget install ExpressVPN.ExpressVPN -e
if "%choice%"=="4" winget install NordVPN.NordVPN -e
if "%choice%"=="5" winget install ProtonTechnologies.ProtonVPN -e
if "%choice%"=="6" winget install Radmin.VPN -e
if "%choice%"=="7" winget install OpenVPNTechnologies.OpenVPN -e
if "%choice%"=="8" winget install OpenVPNTechnologies.OpenVPNConnect -e
if "%choice%"=="9" winget install WireGuard.WireGuard -e
if "%choice%"=="10" winget install MullvadVPN.MullvadVPN -e
if "%choice%"=="11" winget install uvncbvba.UltraVnc -e
if "%choice%"=="12" winget install RealVNC.VNCViewer -e
if "%choice%"=="13" winget install RealVNC.VNCServer -e
if "%choice%"=="14" winget install AnyDeskSoftwareGmbH.AnyDesk -e
if "%choice%"=="15" winget install TeamViewer.TeamViewer -e
if "%choice%"=="16" winget install Google.ChromeRemoteDesktopHost -e
if "%choice%"=="17" goto install_programG17
if "%choice%"=="18" goto install_programG18
if "%choice%"=="19" goto install_programG19
if "%choice%"=="20" goto install_programG20
if "%choice%"=="21" winget install mRemoteNG.mRemoteNG -e
if "%choice%"=="22" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install --id 9PNMNF92JNFP --accept-package-agreements --accept-source-agreements --silent"
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
goto menu7
::---------------------------------------------------------------------------------------------------------------------------
