cls
echo ------------------------
choco install dotnet3.5 -y
cls
echo ------------------------
choco install dotnet4.5.1 -y
cls
echo ------------------------
choco install dotnet4.5.2 -y
cls
echo ------------------------
winget install Microsoft.VCRedist.2005.x86 -e
winget install Microsoft.VCRedist.2005.x64 -e
winget install Microsoft.VCRedist.2008.x86 -e
winget install Microsoft.VCRedist.2008.x64 -e
winget install Microsoft.VCRedist.2010.x86 -e
winget install Microsoft.VCRedist.2010.x64 -e
winget install Microsoft.VCRedist.2012.x86 -e
winget install Microsoft.VCRedist.2012.x64 -e
winget install Microsoft.VCRedist.2013.x86 -e
winget install Microsoft.VCRedist.2013.x64 -e
winget install Microsoft.VCRedist.2015+.x86 -e
winget install Microsoft.VCRedist.2015+.x64 -e
cls
echo ------------------------
winget install Google.Chrome -e
cls
echo ------------------------
winget install Notepad++.Notepad++ -e
cls
echo ------------------------
winget install RARLab.WinRAR -e
cls
echo ------------------------
winget install VideoLAN.VLC -e
cls
echo ------------------------
winget install Adobe.Acrobat.Reader.64-bit -e
cls
echo ------------------------
winget install AcroSoftwareInc.CutePDFWriter -e
cls
echo ------------------------
winget install AdrienAllard.FileConverter  -e
cls
echo ------------------------
winget install uvncbvba.UltraVnc -e
cls
echo ------------------------
echo winget ccls
echo ------------------------
choco install dotnet3.5 -y
cls
echo ------------------------
choco install dotnet4.5.1 -y
cls
echo ------------------------
choco install dotnet4.5.2 -y
cls
echo ------------------------
winget install Microsoft.VCRedist.2005.x86 -e
winget install Microsoft.VCRedist.2005.x64 -e
winget install Microsoft.VCRedist.2008.x86 -e
winget install Microsoft.VCRedist.2008.x64 -e
winget install Microsoft.VCRedist.2010.x86 -e
winget install Microsoft.VCRedist.2010.x64 -e
winget install Microsoft.VCRedist.2012.x86 -e
winget install Microsoft.VCRedist.2012.x64 -e
winget install Microsoft.VCRedist.2013.x86 -e
winget install Microsoft.VCRedist.2013.x64 -e
winget install Microsoft.VCRedist.2015+.x86 -e
winget install Microsoft.VCRedist.2015+.x64 -e
cls
echo ------------------------
winget install Google.Chrome -e
cls
echo ------------------------
winget install Notepad++.Notepad++ -e
cls
echo ------------------------
winget install RARLab.WinRAR -e
cls
echo ------------------------
winget install VideoLAN.VLC -e
cls
echo ------------------------
winget install Adobe.Acrobat.Reader.64-bit -e
cls
echo ------------------------
winget install AcroSoftwareInc.CutePDFWriter -e
cls
echo ------------------------
winget install AdrienAllard.FileConverter  -e
cls
echo ------------------------
winget install uvncbvba.UltraVnc -e
cls
echo ------------------------
echo winget choco upgrade
winget upgrade --all
choco upgrade chocolatey
choco upgrade all -y
cls
echo ------------------------
echo Do you want to set up an ***OFFICE*** ? (Yes(Y) / No(N):
set /p answer=
if /i "%answer%"=="Y" (
						start "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe"
)
pause
timeout 2
cls
echo ------------------------
echo mas open or? (Yes(Y) / No(N)):
set /p answer=
if /i "%answer%"=="Y" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1' | iex"
echo ------------------------
cls
echo
echo
echo --------------------------------------
echo --- BUNUDA BITIRDIN HADI IYISIN... ---
echo --------------------------------------
pause
cls
echo --------------------------------
echo ---SEN GEDE RESTRAT AT AGA...---
echo --------------------------------

echo Do you want to ***RESTART*** the computer? (Yes(Y) / No(N)):
set /p answer=
if /i "%answer%"=="Y" shutdown.exe /r /t 00
if /i "%answer%"=="N" exithoco upgrade
winget upgrade --all
choco upgrade chocolatey
choco upgrade all -y
cls
echo ------------------------
echo Do you want to set up an ***OFFICE*** ? (Yes(Y) / No(N):
set /p answer=
if /i "%answer%"=="Y" (
						start "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe"
)
pause
timeout 2
cls
echo ------------------------
echo mas open or? (Yes(Y) / No(N)):
set /p answer=
if /i "%answer%"=="Y" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1' | iex"
echo ------------------------
cls
echo
echo
echo --------------------------------------
echo --- BUNUDA BITIRDIN HADI IYISIN... ---
echo --------------------------------------
pause
cls
echo --------------------------------
echo ---SEN GEDE RESTRAT AT AGA...---
echo --------------------------------

echo Do you want to ***RESTART*** the computer? (Yes(Y) / No(N)):
set /p answer=
if /i "%answer%"=="Y" shutdown.exe /r /t 00
if /i "%answer%"=="N" exit
