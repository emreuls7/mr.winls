@echo off
cls
:menu_08
cls
echo --------------------------------------------------------------
echo --- menu_08 --- Media Player Install ---                   ---
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
if "%choice%"=="1" winget install VideoLAN.VLC -e
if "%choice%"=="2" winget install clsid2.mpc-hc -e
if "%choice%"=="3" winget install XBMCFoundation.Kodi -e
if "%choice%"=="4" winget install GOMLab.GOMPlayer -e
if "%choice%"=="5" winget install AIMP.AIMP -e
if "%choice%"=="6" winget install Winamp.Winamp -e
if "%choice%"=="7" choco install bsplayer -y
if "%choice%"=="8" winget install Apple.iTunes -e
if "%choice%"=="9" (
echo ------------------------------------------------------------------------
echo	Turk Kanallari Legal IPTV Playlist [Otomatik Gucelleme] - 2024 AKTIF
echo	http://stream.tvcdn.net/lists/tr.m3u
echo	http://stream.tvcdn.net/lists/tr-alt.m3u
echo	http://stream.tvcdn.net/lists/tr-ss.m3u
echo ------------------------------------------------------------------------
echo	Grouped by category
echo	https://iptv-org.github.io/iptv/index.category.m3u
echo	Grouped by language
echo	https://iptv-org.github.io/iptv/index.language.m3u
echo	Grouped by country
echo	https://iptv-org.github.io/iptv/index.country.m3u
echo	Grouped by region
echo	https://iptv-org.github.io/iptv/index.region.m3u
echo ------------------------------------------------------------------------
winget install 4gray.iptvnator -e
)
if "%choice%"=="10" winget install Spotify.Spotify -e
if "%choice%"=="11" winget install MartinFinnerup.YouTubeMusicforDesktop -e
if "%choice%"=="12" goto install_programH12
if "%choice%"=="13" goto install_programH13
if "%choice%"=="14" goto install_programH14
if "%choice%"=="15" goto install_programH15
if "%choice%"=="16" goto install_programH16
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
goto menu_08
::---------------------------------------------------------------------------------------------------------------------------
