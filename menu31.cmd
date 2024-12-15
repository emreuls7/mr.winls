@echo off
cls
:menu_31
cls
echo -------------------------------------------------------------------
echo --- menu_31    ---Setup Program Installer ISO EXE---            ---
echo -------------------------------------------------------------------
echo [1] Adobe Master Collection
echo [2] Blackmagic Design Davinci Resolve Studio
echo [3] CorelDRAW Graphics Suite                                                                                     
echo [4] SketchUp Pro
echo [5] AutoCAD
echo [6] AutoCAD Map
echo [7] AutoCAD Architecture
echo [8] VMware Workstation Pro
echo [9] PDF Converter Elite
echo -------------------------------------------------------------------
echo [0] Exit
echo -------------------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------

:: Define temporary directory
set "tempDir=C:\Windows\Temp"


if "%choice%"=="1" (
                    cls
                    echo --------------------
                    echo 1 	adobe firewallblock run s admin.bat
                    echo 2 	adobe hostadd run s admin.bat
                    echo 3 	Set-up.exe
                    echo --------------------
                    "\\192.168.18.2\setup\source\iso\Adobe.Master.Collection.2024.v6.x64.iso"
                    pause
)
if "%choice%"=="2" ( 
                    cls
                    "\\192.168.18.2\setup\source\iso\Blackmagic Design Davinci Resolve Studio v18.6.4 Build 6 (x64) Multilingual Pre-Activated.iso"
                    pause
)
if "%choice%"=="3" (
                    cls
                    echo --------------------
                    echo 1 	Run .Exe
                    echo 2 	reg2024.reg
                    echo --------------------
                    start /wait "" "\\192.168.18.2\setup\source\iso\CorelDRAW Graphics Suite 2024 v25.0.0.230 (x64) Multilingual Pre-Activated.iso"
                    pause
)
if "%choice%"=="4" (
                    cls
                    "\\192.168.18.2\setup\source\iso\SketchUp Pro 2024 v24.0.553 (x64) Multilingual Pre-Activated.iso"
                    pasue
)
if "%choice%"=="5" (
                    cls
                    start /wait "" "\\192.168.18.2\setup\source\iso\AutoCAD_2024_English_Win_64-bit.iso"
                    pause
                    robocopy "\\192.168.18.2\setup\source\key-crack+\AutoCAD2024Crack" "C:\Program Files\Autodesk\AutoCAD 2024" acad.exe /IS
                    pause
)
if "%choice%"=="6" (
                    cls
                    start /wait "" "\\192.168.18.2\setup\source\iso\AutoCAD_Map_2024_English_Win_64-bit.iso"
                    pause
)
if "%choice%"=="7" (
                    cls
                    start /wait "" "\\192.168.18.2\setup\source\iso\AutoCAD_Architecture_2024_English_Win_64-bit.iso"
                    pause
)
if "%choice%"=="8" (
                    cls
                    start /wait "" "\\192.168.18.2\setup\source\iso\VMware-WorkstationPro.iso"
                    echo ==================================
                    echo Key	MC60H-DWHD5-H80U9-6V85M-8280D
                    echo Key	4A4RR-813DK-M81A9-4U35H-06KND
                    echo Key	NZ4RR-FTK5H-H81C1-Q30QH-1V2LA
                    echo Key	JU090-6039P-08409-8J0QH-2YR7F
                    echo Key	4Y09U-AJK97-089Z0-A3054-83KLA
                    echo Key	4C21U-2KK9Q-M8130-4V2QH-CF810
                    echo ==================================
                    pause
)
if "%choice%"=="9" (
cls
start /wait "" "\\192.168.18.2\setup\source\iso\PDFConverterElite.iso"
pause
robocopy "\\192.168.18.2\setup\source\key-crack+\PDF_Converter_Elite" "C:\Program Files\PDFConverter.com\PDF Converter Elite 5.0" PDFConverterElite.exe /IS
pause
)
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0"
::---------------------------------------------------------------------------------------------------------------------------
goto menu_31
::---------------------------------------------------------------------------------------------------------------------------
