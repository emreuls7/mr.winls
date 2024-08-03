# Define a function to show the menu
function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "--- menu_21    --- * System File Fixed * ---                    ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] System File Checker"
    Write-Host "[2] DISM Scan Health"
    Write-Host "[3] DISM Check Health"
    Write-Host "[4] DISM Restore Health"
    Write-Host "[5] Group Policy Updates Forcing"
    Write-Host "[6] Enable SMB 1.0/CIFS File Sharing Support on Windows"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
}

# Main loop to handle menu choices
do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3,4,5,6)"

    switch ($choice) {
        '1' {
            Write-Host "Running System File Checker..."
            sfc /scannow
            Pause
        }
        '2' {
            Write-Host "Running DISM Scan Health..."
            DISM /Online /Cleanup-Image /ScanHealth
            Pause
        }
        '3' {
            Write-Host "Running DISM Check Health..."
            DISM /Online /Cleanup-Image /CheckHealth
            Pause
        }
        '4' {
            Write-Host "Running DISM Restore Health..."
            DISM /Online /Cleanup-Image /RestoreHealth
            Pause
        }
        '5' {
            Write-Host "Forcing Group Policy Updates..."
            gpupdate /force
            Pause
        }
        '6' {
            Write-Host "Enabling SMB 1.0/CIFS File Sharing Support..."
            dism.exe /online /enable-feature /featurename:"SMB1Protocol"
            Pause
        }
        '0' {
            Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/fix.ps1").Content
            }
            exit
        }
        default {
            Write-Host "Invalid choice. Please enter a valid option."
            Pause
        }
    }
} while ($true)

