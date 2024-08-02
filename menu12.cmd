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
if "%choice%"=="1" choco install dotnet3.5 -y & goto menu_12
if "%choice%"=="2" choco install dotnet4.5.1 -y & goto menu_12
if "%choice%"=="3" choco install dotnet4.5.2 -y & goto menu_12
if "%choice%"=="4" winget install Microsoft.OpenJDK.11 -e & goto menu_12
if "%choice%"=="5" winget install Microsoft.OpenJDK.16 -e & goto menu_12
if "%choice%"=="6" winget install Microsoft.OpenJDK.17 -e & goto menu_12
if "%choice%"=="7" winget install Microsoft.OpenJDK.21 -e & goto menu_12
if "%choice%"=="8" winget install Microsoft.dotnetRuntime.3-x64 -e & goto menu_12
if "%choice%"=="9" winget install Microsoft.dotnetRuntime.3-x86 -e & goto menu_12
if "%choice%"=="10" winget install Microsoft.dotnetRuntime.5-x64 -e & goto menu_12
if "%choice%"=="11" winget install Microsoft.dotnetRuntime.5-x86 -e & goto menu_12
if "%choice%"=="12" winget install Microsoft.dotnetRuntime.6-x64 -e & goto menu_12
if "%choice%"=="13" winget install Microsoft.dotnetRuntime.6-x86 -e & goto menu_12
if "%choice%"=="14" winget install Microsoft.VCRedist.2005.x86 -e & goto menu_12
if "%choice%"=="15" winget install Microsoft.VCRedist.2005.x64 -e & goto menu_12
if "%choice%"=="16" winget install Microsoft.VCRedist.2008.x86 -e & goto menu_12
if "%choice%"=="17" winget install Microsoft.VCRedist.2008.x64 -e & goto menu_12
if "%choice%"=="18" winget install Microsoft.VCRedist.2010.x86 -e & goto menu_12
if "%choice%"=="19" winget install Microsoft.VCRedist.2010.x64 -e & goto menu_12
if "%choice%"=="20" winget install Microsoft.VCRedist.2012.x86 -e & goto menu_12
if "%choice%"=="21" winget install Microsoft.VCRedist.2012.x64 -e & goto menu_12
if "%choice%"=="22" winget install Microsoft.VCRedist.2013.x86 -e & goto menu_12
if "%choice%"=="23" winget install Microsoft.VCRedist.2013.x64 -e & goto menu_12
if "%choice%"=="24" winget install Microsoft.VCRedist.2015+.x86 -e & goto menu_12
if "%choice%"=="25" winget install Microsoft.VCRedist.2015+.x64 -e & goto menu_12
if "%choice%"=="26" winget install Microsoft.DotNet.Runtime.3_1 -e & goto menu_12
if "%choice%"=="27" winget install Microsoft.DotNet.Runtime.5 -e & goto menu_12
if "%choice%"=="28" winget install Microsoft.DotNet.Runtime.6 -e & goto menu_12
if "%choice%"=="29" winget install Microsoft.DotNet.Runtime.7 -e & goto menu_12
if "%choice%"=="30" winget install Microsoft.DotNet.Runtime.8 -e & goto menu_12
if "%choice%"=="31" winget install Microsoft.DotNet.Runtime.Preview -e & goto menu_12
if "%choice%"=="32" winget install Microsoft.DotNet.HostingBundle.3_1 -e & goto menu_12
if "%choice%"=="33" winget install Microsoft.DotNet.HostingBundle.5 -e & goto menu_12
if "%choice%"=="34" winget install Microsoft.DotNet.HostingBundle.6 -e & goto menu_12
if "%choice%"=="35" winget install Microsoft.DotNet.HostingBundle.7 -e & goto menu_12
if "%choice%"=="36" winget install Microsoft.DotNet.HostingBundle.8 -e & goto menu_12
if "%choice%"=="37" winget install Microsoft.DotNet.HostingBundle.Preview -e & goto menu_12
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
goto menu_12
::---------------------------------------------------------------------------------------------------------------------------
