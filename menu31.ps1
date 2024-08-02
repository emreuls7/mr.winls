# Define a function to show the menu
function Show-Menu_31 {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_31    --- Setup Program Installer ISO EXE ---           ---"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] Adobe Master Collection"
    Write-Host "[2] Blackmagic Design Davinci Resolve Studio"
    Write-Host "[3] CorelDRAW Graphics Suite"
    Write-Host "[4] SketchUp Pro"
    Write-Host "[5] AutoCAD"
    Write-Host "[6] AutoCAD Map"
    Write-Host "[7] AutoCAD Architecture"
    Write-Host "[8] VMware Workstation Pro"
    Write-Host "[9] PDF Converter Elite"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit"
    Write-Host "-------------------------------------------------------------------"
}

# Main loop to handle menu choices
do {
    Show-Menu_31
    $choice = Read-Host "Enter your choice (0,1,2,3,...):"

    switch ($choice) {
        '1' {
            cls
            Write-Host "--------------------"
            Write-Host "1  adobe firewallblock run s admin.bat"
            Write-Host "2  adobe hostadd run s admin.bat"
            Write-Host "3  Set-up.exe"
            Write-Host "--------------------"
            Start-Process -FilePath "\\192.168.18.2\setup\source\iso\Adobe.Master.Collection.2024.v6.x64.iso" -NoNewWindow
            Pause
        }
        '2' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\iso\Blackmagic Design Davinci Resolve Studio v18.6.4 Build 6 (x64) Multilingual Pre-Activated.iso" -NoNewWindow
            Pause
        }
        '3' {
            cls
            Write-Host "--------------------"
            Write-Host "1  Run .Exe"
            Write-Host "2  reg2024.reg"
            Write-Host "--------------------"
            Start-Process -FilePath "\\192.168.18.2\setup\source\iso\CorelDRAW Graphics Suite 2024 v25.0.0.230 (x64) Multilingual Pre-Activated.iso" -NoNewWindow -Wait
            Pause
        }
        '4' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\iso\SketchUp Pro 2024 v24.0.553 (x64) Multilingual Pre-Activated.iso" -NoNewWindow
            Pause
        }
        '5' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\iso\AutoCAD_2024_English_Win_64-bit.iso" -NoNewWindow -Wait
            Start-Process -FilePath "robocopy" -ArgumentList "\\192.168.18.2\setup\source\key-crack+\AutoCAD2024Crack", "C:\Program Files\Autodesk\AutoCAD 2024", "acad.exe", "/IS" -NoNewWindow -Wait
            Pause
        }
        '6' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\iso\AutoCAD_Map_2024_English_Win_64-bit.iso" -NoNewWindow -Wait
            Pause
        }
        '7' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\iso\AutoCAD_Architecture_2024_English_Win_64-bit.iso" -NoNewWindow -Wait
            Pause
        }
        '8' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\iso\VMware-WorkstationPro.iso" -NoNewWindow -Wait
            Write-Host "==================================="
            Write-Host "Key   MC60H-DWHD5-H80U9-6V85M-8280D"
            Write-Host "Key   4A4RR-813DK-M81A9-4U35H-06KND"
            Write-Host "Key   NZ4RR-FTK5H-H81C1-Q30QH-1V2LA"
            Write-Host "Key   JU090-6039P-08409-8J0QH-2YR7F"
            Write-Host "Key   4Y09U-AJK97-089Z0-A3054-83KLA"
            Write-Host "Key   4C21U-2KK9Q-M8130-4V2QH-CF810"
            Write-Host "==================================="
            Pause
        }
        '9' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\iso\PDFConverterElite.iso" -NoNewWindow -Wait
            Start-Process -FilePath "robocopy" -ArgumentList "\\192.168.18.2\setup\source\key-crack+\PDF_Converter_Elite", "C:\Program Files\PDFConverter.com\PDF Converter Elite 5.0", "PDFConverterElite.exe", "/IS" -NoNewWindow -Wait
            Pause
        }
        '0' {
            # Exit
            exit
        }
        default {
            Write-Host "Invalid choice. Please enter a valid option."
            Pause
        }
    }
} while ($true)

