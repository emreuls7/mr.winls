@echo off
cls
:menu_12
cls
echo -------------------------------------------------------------------
echo --- menu_12 --- Microsoft .NET Installer ---                    ---
echo -------------------------------------------------------------------
echo [1]  Microsoft Dot Net Framework 3.5
echo [2]  Microsoft Dot Net Framework 4.5.1
echo [3]  Microsoft Dot Net Framework 4.5.2
echo [4]  Microsoft Build of OpenJDK with Hotspot 11
echo [5]  Microsoft Build of OpenJDK with Hotspot 16
echo [6]  Microsoft Build of OpenJDK with Hotspot 17
echo [7]  Microsoft Build of OpenJDK with Hotspot 21
echo [8]  Microsoft Windows Desktop Runtime - 3 (x64)
echo [9]  Microsoft Windows Desktop Runtime - 3 (x86)
echo [10] Microsoft Windows Desktop Runtime - 5 (x64)
echo [11] Microsoft Windows Desktop Runtime - 5 (x86)
echo [12] Microsoft Windows Desktop Runtime - 6 (x64)
echo [13] Microsoft Windows Desktop Runtime - 6 (x86)
echo [14] Microsoft Visual C++ 2005 Redistributable (x86)
echo [15] Microsoft Visual C++ 2005 Redistributable (x64)
echo [16] Microsoft Visual C++ 2008 Redistributable (x86)
echo [17] Microsoft Visual C++ 2008 Redistributable (x64)
echo [18] Microsoft Visual C++ 2010 Redistributable (x86)
echo [19] Microsoft Visual C++ 2010 Redistributable (x64)
echo [20] Microsoft Visual C++ 2012 Redistributable (x86)
echo [21] Microsoft Visual C++ 2012 Redistributable (x64)
echo [22] Microsoft Visual C++ 2013 Redistributable (x86)
echo [23] Microsoft Visual C++ 2013 Redistributable (x64)
echo [24] Microsoft Visual C++ 2015+ Redistributable (x86)
echo [25] Microsoft Visual C++ 2015+ Redistributable (x64)
echo [26] Microsoft .NET Runtime 3.1
echo [27] Microsoft .NET Runtime 5.0
echo [28] Microsoft .NET Runtime 6.0
echo [29] Microsoft .NET Runtime 7.0
echo [30] Microsoft .NET Runtime 8.0
echo [31] Microsoft .NET Runtime 9.0 Preview
echo [32] Microsoft ASP.NET Core Hosting Bundle 3.1
echo [33] Microsoft ASP.NET Core Hosting Bundle 5.0
echo [34] Microsoft ASP.NET Core Hosting Bundle 6.0
echo [35] Microsoft ASP.NET Core Hosting Bundle 7.0
echo [36] Microsoft ASP.NET Core Hosting Bundle 8.0
echo [37] Microsoft ASP.NET Core Hosting Bundle 9.0 Preview
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
echo.
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" goto install_programL1
if "%choice%"=="2" goto install_programL2
if "%choice%"=="3" goto install_programL3
if "%choice%"=="4" goto install_programL4
if "%choice%"=="5" goto install_programL5
if "%choice%"=="6" goto install_programL6
if "%choice%"=="7" goto install_programL7
if "%choice%"=="8" goto install_programL8
if "%choice%"=="9" goto install_programL9
if "%choice%"=="10" goto install_programL10
if "%choice%"=="11" goto install_programL11
if "%choice%"=="12" goto install_programL12
if "%choice%"=="13" goto install_programL13
if "%choice%"=="14" goto install_programL14
if "%choice%"=="15" goto install_programL15
if "%choice%"=="16" goto install_programL16
if "%choice%"=="17" goto install_programL17
if "%choice%"=="18" goto install_programL18
if "%choice%"=="19" goto install_programL19
if "%choice%"=="20" goto install_programL20
if "%choice%"=="21" goto install_programL21
if "%choice%"=="22" goto install_programL22
if "%choice%"=="23" goto install_programL23
if "%choice%"=="24" goto install_programL24
if "%choice%"=="25" goto install_programL25
if "%choice%"=="26" goto install_programL26
if "%choice%"=="27" goto install_programL27
if "%choice%"=="28" goto install_programL28
if "%choice%"=="29" goto install_programL29
if "%choice%"=="30" goto install_programL30
if "%choice%"=="31" goto install_programL31
if "%choice%"=="32" goto install_programL32
if "%choice%"=="33" goto install_programL33
if "%choice%"=="34" goto install_programL34
if "%choice%"=="35" goto install_programL35
if "%choice%"=="36" goto install_programL36
if "%choice%"=="37" goto install_programL37
if "%choice%"=="38" goto install_programL38
if "%choice%"=="39" goto install_programL39
if "%choice%"=="40" goto install_programL40
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" goto main_menu
::---------------------------------------------------------------------------------------------------------------------------
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL1
cls
choco install dotnet3.5 -y
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL2
cls
choco install dotnet4.5.1 -y
goto menu_12
::--------------------------------------------------------------------------------------------------------------------------
:install_programL3
cls
choco install dotnet4.5.2 -y
::winget install Microsoft.DotNet.Framework.DeveloperPack.4.5
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL4
cls
winget install Microsoft.OpenJDK.11 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL5
cls
winget install Microsoft.OpenJDK.16 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL6
cls
winget install Microsoft.OpenJDK.17 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL7
cls
winget install Microsoft.OpenJDK.21 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL8
cls
winget install Microsoft.dotnetRuntime.3-x64 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL9
cls
winget install Microsoft.dotnetRuntime.3-x86 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL10
cls
winget install Microsoft.dotnetRuntime.5-x64 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL11
cls
winget install Microsoft.dotnetRuntime.5-x86 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL12
cls
winget install Microsoft.dotnetRuntime.6-x64 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL13
cls
winget install Microsoft.dotnetRuntime.6-x86 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL14
cls
winget install Microsoft.VCRedist.2005.x86 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL15
cls
winget install Microsoft.VCRedist.2005.x64 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL16
cls
winget install Microsoft.VCRedist.2008.x86 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL17
cls
winget install Microsoft.VCRedist.2008.x64 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL18
cls
winget install Microsoft.VCRedist.2010.x86 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL19
cls
winget install Microsoft.VCRedist.2010.x64 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL20
cls
winget install Microsoft.VCRedist.2012.x86 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL21
cls
winget install Microsoft.VCRedist.2012.x64 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL22
cls
winget install Microsoft.VCRedist.2013.x86 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL23
cls
winget install Microsoft.VCRedist.2013.x64 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL24
cls
winget install Microsoft.VCRedist.2015+.x86 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL25
cls
winget install Microsoft.VCRedist.2015+.x64 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL26
cls
winget install Microsoft.DotNet.Runtime.3_1 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL27
cls
winget install Microsoft.DotNet.Runtime.5 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL28
cls
winget install Microsoft.DotNet.Runtime.6 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL29
cls
winget install Microsoft.DotNet.Runtime.7 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL30
cls
winget install Microsoft.DotNet.Runtime.8 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL31
cls
winget install Microsoft.DotNet.Runtime.Preview -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL32
cls
winget install Microsoft.DotNet.HostingBundle.3_1 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL33
cls
winget install Microsoft.DotNet.HostingBundle.5 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL34
cls
winget install Microsoft.DotNet.HostingBundle.6 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL35
cls
winget install Microsoft.DotNet.HostingBundle.7 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL36
cls
winget install Microsoft.DotNet.HostingBundle.8 -e
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
:install_programL37
cls
winget install Microsoft.DotNet.HostingBundle.Preview -e
goto menu_12