# PowerShell Script

Write-Host "----------------------------------------------------------------------------------------"
Write-Host "Install List"
Write-Host "-------------"
$answer = Read-Host "Do you want to install it on your computer? (Yes(Y) / No(N))"

if ($answer -eq 'Y' -or $answer -eq 'y') {
    Write-Host "Installation process starting..."
    Start-Sleep -Seconds 2
    Write-Host "------------------------"
    
    # Disable User Account Control
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 0
    Write-Host "------------------------"
    
    # Turn off Windows Defender Firewall
    Set-NetFirewallProfile -All -Enabled False
    Write-Host "------------------------"
    
    # Enable Network Discovery and File Sharing
    Enable-NetFirewallRule -DisplayGroup "Network Discovery"
    Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"
    Set-Service -Name fdphost -StartupType Automatic
    Set-Service -Name fdrespub -StartupType Automatic
    Set-Service -Name upnphost -StartupType Automatic
    Set-Service -Name SSDPSRV -StartupType Automatic
    Start-Service -Name fdphost
    Start-Service -Name fdrespub
    Start-Service -Name upnphost
    Start-Service -Name SSDPSRV
    Write-Host "------------------------"
    
    # Disable 'Accounts: Limit local account use of blank passwords to console logon only' setting
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Value 0
    Write-Host "------------------------"
    
    # Enable "Launching applications and unsafe files" in Internet Options
    $internetSettings = @{
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" = 1806
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" = 1806
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" = 1806
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" = 1806
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" = 1806
    }
    foreach ($path in $internetSettings.Keys) {
        Set-ItemProperty -Path $path -Name "1806" -Value $internetSettings[$path]
    }
    Write-Host "------------------------"
    
    # Network Folder FIX
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "AllowInsecureGuestAuth" -Value 1
    Write-Host "------------------------"
    
    # Check if Ultimate Performance power plan exists
    $plan = powercfg /list | Select-String -Pattern "e9a42b02-d5df-448d-aa00-03f14749eb61"
    if ($plan) {
        Write-Host "Ultimate Performance power plan already exists. Activating it..."
        powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
    } else {
        Write-Host "Ultimate Performance power plan does not exist. Creating it..."
        powercfg /create "Ultimate Performance" e9a42b02-d5df-448d-aa00-03f14749eb61
        powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
    }

    # Disabling Fast Startup
    powercfg /h off
    Write-Host "------------------------"
    
    # Power management settings are being set to "Never"
    powercfg /change monitor-timeout-ac 0
    powercfg /change monitor-timeout-dc 0
    powercfg /change standby-timeout-ac 0
    powercfg /change standby-timeout-dc 0
    powercfg /change disk-timeout-ac 0
    powercfg /change disk-timeout-dc 0
    powercfg /change hibernate-timeout-ac 0
    powercfg /change hibernate-timeout-dc 0
    Write-Host "------------------------"
    
    # Enable administrator account
    Enable-LocalUser -Name "Administrator"
    Set-LocalUser -Name "Administrator" -Password (ConvertTo-SecureString "412199" -AsPlainText -Force)
    Write-Host "------------------------"
    
    # Enable Remote Desktop
    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
    Write-Host "Remote Desktop has been enabled for Administrator."
    Write-Host "------------------------"
    
    # Enable SMB 1.0/CIFS File Sharing Support
    Enable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol"
    Write-Host "------------------------"
    
    # Install winget
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1' -OutFile "$env:TEMP\winget.ps1"
    & "$env:TEMP\winget.ps1"
    Remove-Item "$env:TEMP\winget.ps1"
    
    # Install Chocolatey
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1' -OutFile "$env:TEMP\chocolatey.ps1"
    & "$env:TEMP\chocolatey.ps1"
    Remove-Item "$env:TEMP\chocolatey.ps1"
    
    Write-Host "------------------------"
    Start-Sleep -Seconds 2
    Write-Host "Installing .NET versions..."
    choco install dotnet3.5 -y
    choco install dotnet4.5.1 -y
    choco install dotnet4.5.2 -y
    Write-Host "------------------------"
    Start-Sleep -Seconds 2
    Write-Host "Installing Visual C++ Redistributables..."
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
    Write-Host "------------------------"
    Write-Host "Installing other applications..."
    winget install Google.Chrome -e
    winget install Notepad++.Notepad++ -e
    winget install RARLab.WinRAR -e
    winget install VideoLAN.VLC -e
    winget install Adobe.Acrobat.Reader.64-bit -e
    winget install AcroSoftwareInc.CutePDFWriter -e
    winget install AdrienAllard.FileConverter -e
    winget install uvncbvba.UltraVnc -e
    Write-Host "------------------------"
    
    Write-Host "Upgrading installed applications..."
    winget upgrade --all
    choco upgrade chocolatey
    choco upgrade all -y
    
    Write-Host "------------------------"
    Start-Sleep -Seconds 2
    Write-Host "Do you want to set up an ***OFFICE*** ? (Yes(Y) / No(N))"
    $officeAnswer = Read-Host
    if ($officeAnswer -eq 'Y' -or $officeAnswer -eq 'y') {
        Start-Process -FilePath "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe" -Wait
    }
    
    Write-Host "------------------------"
    Start-Sleep -Seconds 2
    
    # Download and execute the activation script
    Write-Host "Downloading and executing activation script..."
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/0884271c4fcdc72d95bce7c5c7bdf77ef4a9bcef/MAS/All-In-One-Version/MAS_AIO-CRC32_31F7FD1E.cmd' -OutFile "$env:TEMP\MAS_AIO-CRC32_31F7FD1E.cmd"
    & "$env:TEMP\MAS_AIO-CRC32_31F7FD1E.cmd"
    Remove-Item "$env:TEMP\MAS_AIO-CRC32_31F7FD1E.cmd"
    
    Write-Host "------------------------"
    Pause
}
else {
    Write-Host "------------------------"
    Start-Sleep -Seconds 2
}

Write-Host "Exiting script..."
Exit

