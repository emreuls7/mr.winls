# Clear the console
Clear-Host

Start-Sleep -Seconds 2
Clear-Host
Write-Host "Installing .NET Frameworks..."
choco install dotnet3.5 -y
choco install dotnet4.5.1 -y
choco install dotnet4.5.2 -y


Clear-Host
Write-Host "Installing VC Redistributables..."
$vcRedists = @(
    "Microsoft.VCRedist.2005.x86",
    "Microsoft.VCRedist.2005.x64",
    "Microsoft.VCRedist.2008.x86",
    "Microsoft.VCRedist.2008.x64",
    "Microsoft.VCRedist.2010.x86",
    "Microsoft.VCRedist.2010.x64",
    "Microsoft.VCRedist.2012.x86",
    "Microsoft.VCRedist.2012.x64",
    "Microsoft.VCRedist.2013.x86",
    "Microsoft.VCRedist.2013.x64",
    "Microsoft.VCRedist.2015+.x86",
    "Microsoft.VCRedist.2015+.x64",
)
foreach ($redistributable in $vcRedists) {
    winget install $redistributable -e
}


Clear-Host
Write-Host "Installing additional software..."
$software = @(
    "Google.Chrome",
    "Notepad++.Notepad++",
    "RARLab.WinRAR",
    "VideoLAN.VLC",
    "Adobe.Acrobat.Reader.64-bit",
    "AcroSoftwareInc.CutePDFWriter",
    "AdrienAllard.FileConverter",
    "uvncbvba.UltraVnc",
    "Microsoft.PCManager",
    "Microsoft.PowerToys",
    "Microsoft.Skype",
    "Microsoft.PowerShell",
)
foreach ($app in $software) {
    winget install $app -e
}

# whatsapp
Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9NKSQGP7F2NH --accept-package-agreements --accept-source-agreements --silent"' -Wait

# Windows Scan
Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9WZDNCRFJ3PV --accept-package-agreements --accept-source-agreements --silent"' -Wait


Clear-Host
Write-Host "Upgrading installed software..."
winget upgrade --all
choco upgrade chocolatey
choco upgrade all -y


Clear-Host
# Define the path to the Google Chrome executable
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
# Check if Chrome exists at the specified path
if (Test-Path $chromePath) {
    Write-Host "Google Chrome found at $chromePath"
    # Define registry paths and values for HTTP and HTTPS protocols
    $regPathHttp = "HKCR:\http\shell\open\command"
    $regPathHttps = "HKCR:\https\shell\open\command"
    $chromeCommand = "`"$chromePath`" -- `%1`"  # Note the escaping for registry
    # Set the default command for HTTP and HTTPS to Google Chrome
    Set-ItemProperty -Path $regPathHttp -Name "(default)" -Value $chromeCommand
    Set-ItemProperty -Path $regPathHttps -Name "(default)" -Value $chromeCommand
    # Notify user
    Write-Host "Google Chrome has been set as the default browser for HTTP and HTTPS protocols."
} else {
    Write-Host "Google Chrome not found at $chromePath. Please make sure it is installed."
}

Clear-Host
# Define the path to the Adobe Reader executable
$adobePath = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
# Check if Adobe Reader exists at the specified path
if (Test-Path $adobePath) {
    Write-Host "Adobe Reader found at $adobePath"
    # Define registry paths and values for PDF files
    $pdfRegistryPath = "HKCR:\.pdf\shell\open\command"
    $adobeCommand = "`"$adobePath`" `"%1`"  # Note the escaping for registry
    # Set the default command for PDF files to Adobe Reader
    Set-ItemProperty -Path $pdfRegistryPath -Name "(default)" -Value $adobeCommand
    # Notify user
    Write-Host "Adobe Reader has been set as the default PDF viewer."
} else {
    Write-Host "Adobe Reader not found at $adobePath. Please make sure it is installed."
}


Clear-Host
# Define the VLC path
$vlcPath = "C:\Program Files\VideoLAN\VLC\vlc.exe"
# Set default associations for common media file types
$fileTypes = @(
    ".mp4",
    ".avi",
    ".mkv",
    ".mov",
    ".wmv",
    ".flv",
    ".mp3",
    ".wav"
)

foreach ($type in $fileTypes) {
    $command = "assoc $type=VLCFile"
    Invoke-Expression $command
}
# Register VLC as a file type handler
$shell = New-Object -ComObject Shell.Application
$folder = $shell.Namespace("C:\")
$folder.ParseName($vlcPath).InvokeVerb("openas")
# Define the path to the WinRAR executable
$winrarPath = "C:\Program Files\WinRAR\WinRAR.exe"
# List of file extensions to associate with WinRAR
$fileExtensions = @(
    ".rar",
    ".zip",
    ".7z",
    ".tar",
    ".gz",
    ".bz2",
    ".xz",
    ".iso"
)
# Helper function to set file association
function Set-FileAssociation {
    param (
        [string]$Extension,
        [string]$ProgramPath
    )
    # Set file association using the default Windows methods
    $progId = "WinRAR_" + $Extension.TrimStart(".")
    $regPath = "HKCU:\Software\Classes\$progId"
    # Create the registry entry for the file type
    New-Item -Path $regPath -Force | Out-Null
    New-ItemProperty -Path $regPath -Name "(Default)" -Value "WinRAR $Extension" -Force | Out-Null
    New-ItemProperty -Path $regPath -Name "FriendlyTypeName" -Value "WinRAR $Extension" -Force | Out-Null
    # Associate the file type with WinRAR
    New-Item -Path "HKCU:\Software\Classes\$progId\shell\open\command" -Force | Out-Null
    Set-ItemProperty -Path "HKCU:\Software\Classes\$progId\shell\open\command" -Name "(Default)" -Value "`"$ProgramPath`" `"%1`"" -Force
    # Associate file extension with ProgID
    Set-ItemProperty -Path "HKCU:\Software\Classes\$Extension" -Name "(Default)" -Value $progId
}
# Iterate over each file extension and set the association
foreach ($ext in $fileExtensions) {
    Set-FileAssociation -Extension $ext -ProgramPath $winrarPath
}
        Write-Host "WinRAR has been set as the default application for specified file types."


Clear-Host
# Install UltraVNC using winget
winget install --id=UltraVNC.UltraVNC --source=winget
# Wait for the installation to complete
Start-Sleep -Seconds 30
# Define the default installation path for UltraVNC
$installPath = "C:\Program Files\UltraVNC"
# Define the password
$password = "412199"
# Write the password to the registry
$regPath = "HKLM:\SOFTWARE\UltraVNC\Server"
$regName = "Password"
# Create the registry key and set the password
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}
Set-ItemProperty -Path $regPath -Name $regName -Value $password
            Write-Output "UltraVNC has been installed and the password has been set."


Clear-Host
# Path to PowerShell 7 executable
$pwshPath = "C:\Program Files\PowerShell\7\pwsh.exe"
if (-Not (Test-Path $pwshPath)) {
    Write-Host "PowerShell 7 is not installed or the path is incorrect."
    exit
}
# Path to the existing PowerShell shortcut
$powershellShortcutPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop\Windows PowerShell.lnk")
if (Test-Path $powershellShortcutPath) {
    # Update the existing shortcut
    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($powershellShortcutPath)
    $shortcut.TargetPath = $pwshPath
    $shortcut.Save()
    Write-Host "Updated PowerShell shortcut: $powershellShortcutPath"
} else {
    # Create a new shortcut
    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($powershellShortcutPath)
    $shortcut.TargetPath = $pwshPath
    $shortcut.WorkingDirectory = [System.IO.Path]::GetDirectoryName($pwshPath)
    $shortcut.Save()
    Write-Host "Created new PowerShell shortcut: $powershellShortcutPath"
}


# Pause to allow user to view the previous message
Start-Sleep -Seconds 2


# Prompt user for restart
# Uncomment if restart is desired
# $restart = Read-Host "Do you want to RESTART the computer? (Yes(Y) / No(N))"
# if ($restart -eq 'Y') {
#    Restart-Computer -Force
# } else {
#    Write-Host "Exiting..."
#    exit
# }

Write-Host "Script execution completed. Press Enter to exit."
Read-Host

# Execute additional script
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pc.ps1").Content
