# Clear the console
Clear-Host

# Output introductory message
Write-Output "-----------------------"
Write-Output "---     User Set    ---"
Write-Output "-----------------------"
Start-Sleep -Seconds 2
Clear-Host

# Disable User Account Control (UAC)
Write-Output "------------------------"
Write-Output "Disabling User Account Control (UAC)..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 0
Clear-Host

# Turn off Windows Defender Firewall
Write-Output "------------------------"
Write-Output "Turning off Windows Defender Firewall..."
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Clear-Host

# Enable Network Discovery and File Sharing
Write-Output "------------------------"
Write-Output "Network Discovery and File Sharing have been enabled..."
Set-NetFirewallRule -DisplayGroup "Network Discovery" -Enabled True
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True

# Start related services for Network Discovery and File Sharing
$services = @("fdphost", "fdrespub", "upnphost", "SSDPSRV")
foreach ($service in $services) {
    Set-Service -Name $service -StartupType Automatic
    Start-Service -Name $service
}
Clear-Host

# Disable blank password use restriction
Write-Output "------------------------"
Write-Output "Disabling 'Accounts: Limit local account use of blank passwords to console logon only' setting..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Value 0
Clear-Host

# Enable launching unsafe files in Internet Options
Write-Output "------------------------"
Write-Output "Enabling 'Launching applications and unsafe files' in Internet Options..."
$zones = 0..4
foreach ($zone in $zones) {
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\$zone" -Name 1806 -Value 0
}
Clear-Host

# Network Folder FIX
Write-Output "------------------------"
Write-Output "Network Folder FIX..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "AllowInsecureGuestAuth" -Value 1
Clear-Host

# Check and set Ultimate Performance power plan
Write-Output "------------------------"
Write-Output "Checking if Ultimate Performance power plan already exists..."
$powerPlan = "e9a42b02-d5df-448d-aa00-03f14749eb61"
$existingPlan = powercfg /list | Select-String -Pattern $powerPlan

if ($existingPlan) {
    Write-Output "Ultimate Performance power plan already exists. Activating it..."
    powercfg /setactive $powerPlan
} else {
    Write-Output "Ultimate Performance power plan does not exist. Creating it..."
    powercfg /create "Ultimate Performance" $powerPlan
    powercfg /setactive $powerPlan
}

# Disable Fast Startup
Write-Output "Disabling Fast Startup..."
powercfg /h off

# Set power management settings to "Never"
Write-Output "Power management settings are being set to 'Never'..."
powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0
powercfg /change disk-timeout-ac 0
powercfg /change disk-timeout-dc 0
powercfg /change hibernate-timeout-ac 0
powercfg /change hibernate-timeout-dc 0
Clear-Host

# Enable administrator account and set password
Write-Output "------------------------"
Write-Output "Enabling administrator account..."
Enable-LocalUser -Name "Administrator"
Write-Output "Setting the password for administrator..."
$adminPassword = ConvertTo-SecureString "412199" -AsPlainText -Force
Set-LocalUser -Name "Administrator" -Password $adminPassword
Clear-Host

# Enable Remote Desktop
Write-Output "------------------------"
Write-Output "Enabling Remote Desktop for Administrator..."
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Clear-Host

# Set the time zone to UTC+2
Write-Output "------------------------"
$timezone = "FLE Standard Time"  # UTC+2 time zone
tzutil /s $timezone

# Get the current date and time and add 2 hours
Write-Output "------------------------"
$currentDateTime = Get-Date
$newDateTime = $currentDateTime.AddHours(2)
Set-Date -Date $newDateTime

Write-Output "Time zone set to '$timezone' and time updated to $newDateTime."


# Define the path to the Google Chrome executable
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Check if Chrome exists at the specified path
if (Test-Path $chromePath) {
    Write-Output "Google Chrome found at $chromePath"

    # Define registry paths and values for HTTP and HTTPS protocols
    $regPathHttp = "HKCR:\http\shell\open\command"
    $regPathHttps = "HKCR:\https\shell\open\command"
    $chromeCommand = "`"$chromePath`" -- `%1`"  # Note the escaping for registry

    # Set the default command for HTTP and HTTPS to Google Chrome
    Set-ItemProperty -Path $regPathHttp -Name "(default)" -Value $chromeCommand
    Set-ItemProperty -Path $regPathHttps -Name "(default)" -Value $chromeCommand

    # Notify user
    Write-Output "Google Chrome has been set as the default browser for HTTP and HTTPS protocols."
} else {
    Write-Output "Google Chrome not found at $chromePath. Please make sure it is installed."
}

# Define the path to the Adobe Reader executable
$adobePath = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

# Check if Adobe Reader exists at the specified path
if (Test-Path $adobePath) {
    Write-Output "Adobe Reader found at $adobePath"

    # Define registry paths and values for PDF files
    $pdfRegistryPath = "HKCR:\.pdf\shell\open\command"
    $adobeCommand = "`"$adobePath`" `"%1`"  # Note the escaping for registry

    # Set the default command for PDF files to Adobe Reader
    Set-ItemProperty -Path $pdfRegistryPath -Name "(default)" -Value $adobeCommand

    # Notify user
    Write-Output "Adobe Reader has been set as the default PDF viewer."
} else {
    Write-Output "Adobe Reader not found at $adobePath. Please make sure it is installed."
}

# Install winget
Write-Output "------------------------"
Write-Output "winget install"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1" -UseBasicP -OutFile "winget.ps1"
& .\winget.ps1
Clear-Host

# Install Chocolatey
Write-Output "------------------------"
Write-Output "choco install"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1" -UseBasicP -OutFile "chocolatey.ps1"
& .\chocolatey.ps1
Clear-Host

# Enable SMB 1.0/CIFS File Sharing Support
Write-Output "------------------------"
Write-Output "Enabling SMB 1.0/CIFS File Sharing Support on Windows..."
Enable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol"
Write-Output "------------------------------------"

# Prompt for restart
$restart = Read-Host "Do you want to ***RESTART*** the computer? (Yes(Y) / No(N))"
if ($restart -eq 'Y' -or $restart -eq 'y') {
    Restart-Computer -Force
}

# Execute additional script
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90.ps1").Content
