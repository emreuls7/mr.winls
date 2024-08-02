# Define a function to show the menu
function Show-Menu_32 {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_32    --- Setup Microsoft Office Installer EXE         ---"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] Microsoft Office Enterprise 2007"
    Write-Host "[2] Microsoft Office Professional 2013"
    Write-Host "[3] Microsoft Office ProPlus 2016"
    Write-Host "[4] Microsoft Office ProPlus 2019"
    Write-Host "[5] Microsoft Office ProPlus 2021"
    Write-Host "[6] Microsoft Office Std 2013"
    Write-Host "[7] Microsoft Office Business 365"
    Write-Host "[8] Microsoft Office ProPlus 365"
    Write-Host "[9] Microsoft Visio Pro 365"
    Write-Host "[10] Microsoft Project Pro 365"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[99] Microsoft Activation Scripts"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit"
    Write-Host "-------------------------------------------------------------------"
}

# Main loop to handle menu choices
do {
    Show-Menu_32
    $choice = Read-Host "Enter your choice (0,1,2,3,...):"

    switch ($choice) {
        '1' {
            cls
            Write-Host "================================================================="
            Write-Host "Key   KGFVY-7733B-8WCK9-KTG64-BC7D8"
            Write-Host "================================================================="
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office2007Enterprise_tr\Setup.exe" -NoNewWindow -Wait
            Pause
        }
        '2' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office2013Pro_tr\setup64.exe" -NoNewWindow -Wait
            Pause
        }
        '3' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office2016ProPlus_tr\setup.exe" -NoNewWindow -Wait
            Pause
        }
        '4' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office2019ProPlus_tr\Setup64.exe" -NoNewWindow -Wait
            Pause
        }
        '5' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe" -NoNewWindow -Wait
            Pause
        }
        '6' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office2013Std_tr\setup.exe" -NoNewWindow -Wait
            Pause
        }
        '7' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office365Business_tr\Setup64.exe" -NoNewWindow -Wait
            Pause
        }
        '8' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office365ProPlus_tr\Setup64.exe" -NoNewWindow -Wait
            Pause
        }
        '9' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office365VisioPro_tr\Setup64.exe" -NoNewWindow -Wait
            Pause
        }
        '10' {
            cls
            Start-Process -FilePath "\\192.168.18.2\setup\source\office\office365ProjectPro_tr\Setup64.exe" -NoNewWindow -Wait
            Pause
        }
        '99' {
            # Running Microsoft Activation Scripts
            powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1 | iex"
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

