@echo off
cls
:menu8
cls
echo --------------------------------------------------------------
echo --- Menu8 --- Media Player Installer --- CREATED BY MRLSx7 ---
echo --------------------------------------------------------------
echo [1]  VLC media player
echo [2]  MPC-HC
echo [3]  Kodi
echo [4]  GOM Player
echo [5]  AIMP
echo [6]  Winamp
echo [7]  BSPlayer Free
echo [8]  iTunes
echo [9]  IPTV Nator
echo [10] Spotify
echo [12] YouTube Music Desktop
echo --------------------------------------------------------------
echo [0] Exit
echo --------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::--------------------------------------------------------------------------------------------------------------------------- 
if "%choice%"=="1" goto install_programH1
if "%choice%"=="2" goto install_programH2
if "%choice%"=="3" goto install_programH3
if "%choice%"=="4" goto install_programH4
if "%choice%"=="5" goto install_programH5
if "%choice%"=="6" goto install_programH6
if "%choice%"=="7" goto install_programH7
if "%choice%"=="8" goto install_programH8
if "%choice%"=="9" goto install_programH9
if "%choice%"=="10" goto install_programH10
if "%choice%"=="11" goto install_programH11
if "%choice%"=="12" goto install_programH12
if "%choice%"=="13" goto install_programH13
if "%choice%"=="14" goto install_programH14
if "%choice%"=="15" goto install_programH15
if "%choice%"=="16" goto install_programH16
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
goto menu8
::---------------------------------------------------------------------------------------------------------------------------
:install_programH1
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
winget install VideoLAN.VLC -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH2
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
winget install clsid2.mpc-hc -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH3
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
winget install XBMCFoundation.Kodi -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH4
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
winget install GOMLab.GOMPlayer -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH5
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
winget install AIMP.AIMP -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH6
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
winget install Winamp.Winamp -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH7
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
choco install bsplayer -y
echo Installation completed.
echo --------------------------------------------------------------
echo	BS Player Pro 2 Keys {B4tman}:-
echo	Registered to (Name): AliThePB
echo	Registration Keys:
echo	2992A28768A933955EB7967B569425ADFAC9B1DA2316
echo	2992A28768A9744D8798343689FD627523E6B1DA2316
echo	2992A28768A9AE3F7A916A03DE5CB807DEEFB1DA2316
echo	2992A28768A98AECEB07C7902EE79CD44F79B1DA2316
echo	2992A28768A9901B04144749E8698623A06AB1DA2316
echo	2992A28768A94E57B688CC9B9BEC586F12F6B1DA2316
echo	2992A28768A94E57B688CC9B9BEC586F12F6B1DA2316
echo	2992A28768A9323B797351692F442403DD0DB1DA2316
echo	2992A28768A9B01EB6A8B3902D0CA62612D6B1DA2316
echo	2992A28768A93D18CCAA83D761142B2068D4B1DA2316
echo	2992A28768A9A855C2FE44326BFCBE6D6680B1DA2316
echo	2992A28768A9E010DF58584861BEF6287B26B1DA2316
echo	2992A28768A94E010D12AED8641D5839A96CB1DA2316
echo	2992A28768A98B293967672A684A9D119D19B1DA2316
echo	2992A28768A9F7700B0174EF600BE148AF7FB1DA2316
echo	2992A28768A9EE1CF2C49266DA19F82456BAB1DA2316
echo	2992A28768A9D9710AA876FD69CECF49AED6B1DA2316
echo	2992A28768A9C204A6E17531A969D43C029FB1DA2316
echo	2992A28768A9D1712C9414608DADC74988EAB1DA2316
echo	2992A28768A9EF6616DAB1A17F48F95EB2A4B1DA2316
echo	2992A28768A972D2820EF022AD8A64EA2670B1DA2316
echo --------------------------------------------------------------
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH8
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
winget install Apple.iTunes -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

::install_programH9
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program

echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

::install_programH10
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program

echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH11
cls
echo --------------------------------------------------------------
echo Installing Program...
echo --------------------------------------------------------------
echo	Turk Kanallari Legal IPTV Playlist [Otomatik Gucelleme] - 2024 AKTIF
echo --------------------------------------------------------------
echo	http://stream.tvcdn.net/lists/tr.m3u
echo	http://stream.tvcdn.net/lists/tr-alt.m3u
echo	http://stream.tvcdn.net/lists/tr-ss.m3u
echo --------------------------------------------------------------
echo	Grouped by category
echo	https://iptv-org.github.io/iptv/index.category.m3u
echo	Grouped by language
echo	https://iptv-org.github.io/iptv/index.language.m3u
echo	Grouped by country
echo	https://iptv-org.github.io/iptv/index.country.m3u
echo	Grouped by region
echo	https://iptv-org.github.io/iptv/index.region.m3u
echo --------------------------------------------------------------
REM Command to install Program
winget install 4gray.iptvnator -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH12
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
winget install Spotify.Spotify -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

:install_programH13
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program
winget install MartinFinnerup.YouTubeMusicforDesktop -e
echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

::install_programH14
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program

echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

::install_programH15
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program

echo Installation completed.
pause
goto menu8

::---------------------------------------------------------------------------------------------------------------------------

::install_programH16
cls
echo --------------------------------------------------------------
echo Installing Program...
REM Command to install Program

echo Installation completed.
pause
goto menu8
