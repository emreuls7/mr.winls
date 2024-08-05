
function Show-Menu {
    Clear-Host
    Write-Host "-------------------------------------------------------------------"
    Write-Host "---            --- * Windows Fixed * ---                        ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] Disabling 'Accounts: Limit local account use of blank passwords to console logon only'"
    Write-Host "[2] Enabling 'Launching applications and unsafe files' in Internet Options"
    Write-Host "[3] Enable Administrator Account"
    Write-Host "[4] Set Administrator Password ( admin )"
    Write-Host "[5] Enabling Remote Desktop for Administrator"
    Write-Host "[6] User Creation ( scan )"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
}


# Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

    switch ($choice) {
        1 {
            Write-Host "Disabling 'Accounts: Limit local account use of blank passwords to console logon only'..."
            Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'LimitBlankPasswordUse' -Value 0
            Write-Host "Blank password use limit disabled."
            Pause
        }
        2 {
            Write-Host "Enabling 'Launching applications and unsafe files' in Internet Options..."
            $zones = 0..4
            foreach ($zone in $zones) {
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\$zone" -Name 1806 -Value 0 -Type DWord
            }
            Write-Host "'Launching applications and unsafe files' enabled."
            Pause
        }
        3 {
            Write-Host "Enabling Administrator Account..."
            net user administrator /active:yes
            Write-Host "Administrator account enabled."
            Pause
        }
        4 {
            Write-Host "Setting Administrator Password..."
            net user administrator admin
            Write-Host "Administrator password set to 'admin'."
            Pause
        }
        5 {
            Write-Host "Enabling Remote Desktop for Administrator..."
            Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0
            Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'
            Write-Host "Remote Desktop enabled."
            Pause
        }
        6 {
            Write-Host "Creating user 'scan'..."
            net user scan /add
            Write-Host "User 'scan' created."
            Pause
        }
        0 {
            exit
            Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/fix.ps1").Content
        }
        default { Write-Host "Invalid choice. Please try again." }
    }
}

# Main script loop
do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    Clear-Host
    Handle-Choice -choice $choice

    # Pause for 2 seconds if the choice is not '0'
    #if ($choice -ne '0') { 
     #   Start-Sleep -Seconds 2 
    #}

    # Prompt the user to press Enter to continue
    Write-Host "`nPress Enter to continue..."
    Read-Host
} while ($choice -ne '0')
