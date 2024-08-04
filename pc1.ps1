# Clear the console
Clear-Host

Start-Sleep -Seconds 2
Clear-Host

# Disable User Account Control (UAC)
Write-Host "------------------------"
Write-Host "Disabling User Account Control (UAC)..."
try {
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0 -Type DWord
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 0 -Type DWord
    Write-Host "UAC has been disabled."
} catch {
    Write-Host "Failed to disable UAC. Error: $_"
}
Clear-Host

# Turn off Windows Defender Firewall
Write-Host "------------------------"
Write-Host "Turning off Windows Defender Firewall..."
try {
    Set-NetFirewallProfile -All -Enabled False
    Write-Host "Windows Defender Firewall is turned off."
} catch {
    Write-Host "Failed to turn off Windows Defender Firewall. Error: $_"
}
Clear-Host

# Enable Network Discovery and File Sharing
Write-Host "------------------------"
Write-Host "Enabling Network Discovery and File Sharing..."
try {
    Set-NetFirewallRule -DisplayGroup "Network Discovery" -Enabled True
    Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True

    # Start related services for Network Discovery and File Sharing
    $services = @('fdphost', 'fdrespub', 'upnphost', 'SSDPSRV')
    foreach ($service in $services) {
        Set-Service -Name $service -StartupType Automatic
        Start-Service -Name $service
    }
    Write-Host "Network Discovery and File Sharing are enabled."
} catch {
    Write-Host "Failed to enable Network Discovery and File Sharing. Error: $_"
}
Clear-Host

# Disable blank password use restriction
Write-Host "------------------------"
Write-Host "Disabling 'Accounts: Limit local account use of blank passwords to console logon only' setting..."
try {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Value 0 -Type DWord
    Write-Host "Blank password use restriction has been disabled."
} catch {
    Write-Host "Failed to disable blank password use restriction. Error: $_"
}
Clear-Host

# Enable launching unsafe files in Internet Options
Write-Host "------------------------"
Write-Host "Enabling 'Launching applications and unsafe files' in Internet Options..."
try {
    for ($zone = 0; $zone -le 4; $zone++) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\$zone" -Name 1806 -Value 0 -Type DWord
    }
    Write-Host "Unsafe file launching has been enabled."
} catch {
    Write-Host "Failed to enable unsafe file launching. Error: $_"
}
Clear-Host

# Network Folder FIX
Write-Host "------------------------"
Write-Host "Network Folder FIX..."
try {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "AllowInsecureGuestAuth" -Value 1 -Type DWord
    Write-Host "Network Folder insecure guest authentication has been enabled."
} catch {
    Write-Host "Failed to enable Network Folder insecure guest authentication. Error: $_"
}
Clear-Host

# Check and set Ultimate Performance power plan
Write-Host "------------------------"
Write-Host "Checking if Ultimate Performance power plan already exists..."
try {
    $powerPlans = powercfg /list | Select-String "Ultimate Performance"
    if ($powerPlans) {
        Write-Host "Ultimate Performance power plan already exists. Activating it..."
        powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
    } else {
        Write-Host "Ultimate Performance power plan does not exist. Creating it..."
        powercfg /create "Ultimate Performance" e9a42b02-d5df-448d-aa00-03f14749eb61
        powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
    }
    Write-Host "Ultimate Performance power plan has been set."
} catch {
    Write-Host "Failed to set Ultimate Performance power plan. Error: $_"
}
Clear-Host

# Disable Fast Startup
Write-Host "Disabling Fast Startup..."
try {
    powercfg /h off
    Write-Host "Fast Startup has been disabled."
} catch {
    Write-Host "Failed to disable Fast Startup. Error: $_"
}
Clear-Host

# Set power management settings to "Never"
Write-Host "Power management settings are being set to 'Never'..."
try {
    powercfg /change monitor-timeout-ac 0
    powercfg /change monitor-timeout-dc 0
    powercfg /change standby-timeout-ac 0
    powercfg /change standby-timeout-dc 0
    powercfg /change disk-timeout-ac 0
    powercfg /change disk-timeout-dc 0
    powercfg /change hibernate-timeout-ac 0
    powercfg /change hibernate-timeout-dc 0
    Write-Host "Power management settings have been updated."
} catch {
    Write-Host "Failed to update power management settings. Error: $_"
}
Clear-Host

# Enable administrator account and set password
Write-Host "------------------------"
Write-Host "Enabling administrator account..."
try {
    Enable-LocalUser -Name "Administrator"
    Write-Host "Setting the password for administrator..."
    $SecurePassword = ConvertTo-SecureString "412199" -AsPlainText -Force
    Set-LocalUser -Name "Administrator" -Password $SecurePassword
    Write-Host "Administrator account has been enabled and password set."
} catch {
    Write-Host "Failed to enable the Administrator account or set the password. Error: $_"
}
Clear-Host

# Enable Remote Desktop
Write-Host "------------------------"
Write-Host "Enabling Remote Desktop for Administrator..."
try {
    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0 -Type DWord
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
    Write-Host "Remote Desktop has been enabled."
} catch {
    Write-Host "Failed to enable Remote Desktop. Error: $_"
}
Clear-Host

# Set the time zone to UTC+2
Write-Host "------------------------"
Write-Host "Setting the time zone to UTC+2..."
try {
    Set-TimeZone -Id "GTB Standard Time"
    Write-Host "Time zone has been set to UTC+2."
} catch {
    Write-Host "Failed to set time zone. Error: $_"
}
Clear-Host

# Set locale settings
Write-Host "Setting locale settings..."
try {
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "Locale" -Value "00000809" -Type String
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "LocaleName" -Value "en-GB" -Type String
    Write-Host "Locale settings have been updated."
} catch {
    Write-Host "Failed to update locale settings. Error: $_"
}
Clear-Host

# Remove Edge
Write-Host "Removing Microsoft Edge..."
try {
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/rm-edgeboth.ps1' -OutFile "$env:TEMP\rm-edgeboth.ps1"
    & "$env:TEMP\rm-edgeboth.ps1"
    Write-Host "Microsoft Edge has been removed."
} catch {
    Write-Host "Failed to remove Microsoft Edge. Error: $_"
}
Clear-Host

# Set default browser to Google Chrome
Write-Host "Setting Google Chrome as the default browser..."
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
if (Test-Path $chromePath) {
    try {
        $regPathHttp = "HKCR\http\shell\open\command"
        $regPathHttps = "HKCR\https\shell\open\command"
        $chromeCommand = "`"$chromePath`" -- `%1`"
        
        Set-ItemProperty -Path $regPathHttp -Name "(default)" -Value $chromeCommand -Type String
        Set-ItemProperty -Path $regPathHttps -Name "(default)" -Value $chromeCommand -Type String
        Write-Host "Google Chrome has been set as the default browser for HTTP and HTTPS protocols."
    } catch {
        Write-Host "Failed to set Google Chrome as default browser. Error: $_"
    }
} else {
    Write-Host "Google Chrome not found at $chromePath. Please make sure it is installed."
}
Clear-Host

# Set default PDF reader to Adobe Reader
Write-Host "Setting Adobe Reader as the default PDF reader..."
$adobePath = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
if (Test-Path $adobePath) {
    try {
        $regPathPdf = "HKCR\.pdf\shell\open\command"
        $adobeCommand = "`"$adobePath`" `"%1`""
        
        Set-ItemProperty -Path $regPathPdf -Name "(default)" -Value $adobeCommand -Type String
        Write-Host "Adobe Reader has been set as the default program for PDF files."
    } catch {
        Write-Host "Failed to set Adobe Reader as default PDF reader. Error: $_"
    }
} else {
    Write-Host "Adobe Reader not found at $adobePath. Please make sure it is installed."
}
Clear-Host

# Install Winget
Write-Host "Installing Winget..."
try {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1'))
    Write-Host "Winget has been installed."
} catch {
    Write-Host "Failed to install Winget. Error: $_"
}
Clear-Host

# Install Chocolatey
Write-Host "Installing Chocolatey..."
try {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1'))
    Write-Host "Chocolatey has been installed."
} catch {
    Write-Host "Failed to install Chocolatey. Error: $_"
}
Clear-Host

# Enable .NET Framework 3.5
Write-Host "------------------------"
Write-Host "Enabling .NET Framework 3.5..."
try {
    Enable-WindowsOptionalFeature -Online -FeatureName NetFx3
    Write-Host ".NET Framework 3.5 has been enabled."
} catch {
    Write-Host "Failed to enable .NET Framework 3.5. Error: $_"
}
Clear-Host

# Enable SMB1 Protocol
Write-Host "------------------------"
Write-Host "Enabling SMB1 Protocol..."
try {
    Start-Process -NoNewWindow -Wait -FilePath "dism.exe" -ArgumentList "/online /enable-feature /featurename:SMB1Protocol"
    Write-Host "SMB1 Protocol has been enabled."
} catch {
    Write-Host "Failed to enable SMB1 Protocol. Error: $_"
}
Clear-Host

# Pause at the end
Write-Host "Script execution completed. Press Enter to exit."
Read-Host

# Execute additional script
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/pc.ps1").Content
