@echo off
cls
:menu_09
cls
echo -------------------------------------------------------------------
echo --- menu_09  --- Chat Messenger Install ---   CREATED BY MRLSx7 ---
echo -------------------------------------------------------------------
echo [1]  WhatsApp
echo [2]  WhatsApp Beta
echo [3]  Telegram Desktop
echo [4]  Telegram Desktop Beta
echo [5]  Discord                                                                                                       
echo [6]  Skype
echo [7]  WeChat
echo [8]  Zoom
echo [9]  Viber
echo [10] Signal
echo [11] Signal Beta
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9NKSQGP7F2NH --accept-package-agreements --accept-source-agreements --silent"
if "%choice%"=="2" powershell -NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9NBDXK71NK08 --accept-package-agreements --accept-source-agreements --silent"
if "%choice%"=="3" winget install Telegram.TelegramDesktop -e
if "%choice%"=="4" winget install Telegram.TelegramDesktop.Beta -e
if "%choice%"=="5" winget install Discord.Discord -e
if "%choice%"=="6" winget install Microsoft.Skype -e
if "%choice%"=="7" winget install Tencent.WeChat -e
if "%choice%"=="8" winget install Zoom.Zoom -e
if "%choice%"=="9" winget install Viber.Viber -e
if "%choice%"=="10" winget install OpenWhisperSystems.Signal -e
if "%choice%"=="11" winget install OpenWhisperSystems.Signal.Beta -e
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
goto menu_09
::---------------------------------------------------------------------------------------------------------------------------
