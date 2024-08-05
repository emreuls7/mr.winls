# Define a function to show the menu
function Show-Menu_21_2 {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "---             --- * Windows Fixed * ---                       ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] Disable User Account Control"
    Write-Host "[2] Enable User Account Control"
    Write-Host "[3] Turning off Windows Defender Firewall"
    Write-Host "[4] Turning on Windows Defender Firewall"
    Write-Host "[5] Network Folder FIX"
    Write-Host "[6] Enable Network Discovery"
    Write-Host "[7] Remove 'Open File - Security Warning' Prompt on Windows"
    Write-Host "[8] Restore 'Open File - Security Warning' Prompt on Windows"
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
            Write-Host "Disabling User Account Control..."
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0 -Type DWord
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 0 -Type DWord
            Write-Host "User Account Control disabled. You need to restart your computer for changes to take effect."
            Pause
        }
        2 {
            Write-Host "Enabling User Account Control..."
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 1 -Type DWord
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 5 -Type DWord
            Write-Host "User Account Control enabled. You need to restart your computer for changes to take effect."
            Pause
        }
        3 {
            Write-Host "Turning off Windows Defender Firewall..."
            netsh advfirewall set allprofiles state off
            Write-Host "Windows Defender Firewall turned off."
            Pause
        }
        4 {
            Write-Host "Turning on Windows Defender Firewall..."
            netsh advfirewall set allprofiles state on
            Write-Host "Windows Defender Firewall turned on."
            Pause
        }
        5 {
            Write-Host "Fixing Network Folder settings..."
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "AllowInsecureGuestAuth" -Value 1 -Type DWord
            Write-Host "Network Folder settings updated."
            Pause
        }
        6 {
            Write-Host "Enabling Network Discovery..."
            netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
            netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
            sc config fdphost start= auto
            sc config fdrespub start= auto
            sc config upnphost start= auto
            sc config SSDPSRV start= auto
            net start fdphost
            net start fdrespub
            net start upnphost
            net start SSDPSRV
            Write-Host "Network Discovery enabled."
            Pause
        }
        7 {
            Write-Host "Removing 'Open File - Security Warning' Prompt..."
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" -Name "LowRiskFileTypes" -Value ".exe;.bat;.reg;.vbs;.js;.msi" -Type String
            Write-Host "'Open File - Security Warning' Prompt removed."
            Pause
        }
        8 {
            Write-Host "Restoring 'Open File - Security Warning' Prompt..."
            Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" -Name "LowRiskFileTypes" -ErrorAction SilentlyContinue
            Write-Host "'Open File - Security Warning' Prompt restored."
            Pause
        }
        0 {
            # exit
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
