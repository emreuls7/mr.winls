# Ensure the script is running as Administrator
if (-not [System.Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544') {
    Write-Output "Run Script As Admin"
    Pause
    Exit
}

# Set expected hash
$expectedHash = '4963532e63884a66ecee0386475ee423ae7f7af8a6c6d160cf1237d085adf05e'

# Function to download file and check hash
function Download-FileIfNeeded {
    param (
        [string]$url,
        [string]$destination,
        [string]$expectedHash
    )

    if (Test-Path $destination) {
        $fileHash = (Get-FileHash -Path $destination -Algorithm SHA256).Hash.ToLower()
        if ($fileHash -eq $expectedHash) {
            return
        } else {
            Remove-Item -Path $destination -Force
        }
    }

    Write-Output "Downloading Required File..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $destination
    } catch {
        Write-Output "Error downloading the file."
        Exit
    }

    $fileHash = (Get-FileHash -Path $destination -Algorithm SHA256).Hash.ToLower()
    if ($fileHash -ne $expectedHash) {
        Write-Output "File hash does not match the expected value."
        Exit
    }
}

# Download the setup file if needed
$url = 'https://raw.githubusercontent.com/ShadowWhisperer/Remove-MS-Edge/main/_Source/setup.exe'
$setupPath = "$env:TEMP\setup.exe"
Download-FileIfNeeded -url $url -destination $setupPath -expectedHash $expectedHash

# Function to uninstall Edge
function Uninstall-Edge {
    param (
        [string]$appPath,
        [string]$uninstallParams
    )

    if (Test-Path $appPath) {
        $apps = Get-ChildItem -Path $appPath -Directory
        foreach ($app in $apps) {
            Start-Process -FilePath $setupPath -ArgumentList $uninstallParams -Wait
        }
    }
}

# Remove Edge
Write-Output "Removing Edge..."
Uninstall-Edge -appPath "C:\Program Files (x86)\Microsoft\Edge\Application\" -uninstallParams "--uninstall --system-level --force-uninstall"

# Remove Edge WebView
Write-Output "Removing EdgeWebView..."
Uninstall-Edge -appPath "C:\Program Files (x86)\Microsoft\EdgeWebView\Application\" -uninstallParams "--uninstall --msedgewebview --system-level --force-uninstall"

# Remove empty Edge WebView folders
Get-ChildItem -Path "C:\Program Files (x86)\Microsoft\EdgeWebView" -Directory -Recurse | Sort-Object -Property FullName -Descending | ForEach-Object {
    Remove-Item -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
}

# Clean up additional files and folders
Write-Output "Removing Additional Junk..."

# Desktop icons
Get-ChildItem -Path "C:\Users" | ForEach-Object {
    Remove-Item -Path "C:\Users\$($_.Name)\Desktop\edge.lnk" -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Users\$($_.Name)\Desktop\Microsoft Edge.lnk" -ErrorAction SilentlyContinue
}

# System32 files
$system32Files = Get-ChildItem -Path "C:\Windows\System32" -Filter "MicrosoftEdge*.exe" -ErrorAction SilentlyContinue
foreach ($file in $system32Files) {
    Takeown /f $file.FullName | Out-Null
    Icacls $file.FullName /inheritance:e /grant "$($env:USERNAME):(OI)(CI)F" /T /C | Out-Null
    Remove-Item -Path $file.FullName -Force -ErrorAction SilentlyContinue
}

# Folders
Remove-Item -Path "C:\ProgramData\Microsoft\EdgeUpdate" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Program Files (x86)\Microsoft\Temp" -Recurse -Force -ErrorAction SilentlyContinue

# Files
Remove-Item -Path "C:\Program Files (x86)\Microsoft\Edge\Edge.dat" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" -Force -ErrorAction SilentlyContinue

# Registry
Write-Output "Cleaning Registry Entries..."
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{9459C573-B17A-45AE-9F64-1857B5D58CEE}" -ErrorAction SilentlyContinue
if (-not (Test-Path "C:\Program Files (x86)\Microsoft\Edge\Application\pwahelper.exe")) {
    Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Edge" -ErrorAction SilentlyContinue
}

# Scheduled Tasks
Write-Output "Removing Scheduled Tasks..."
Get-ScheduledTask | Where-Object {$_.TaskPath -like "*MicrosoftEdge*"} | ForEach-Object {
    Unregister-ScheduledTask -TaskName $_.TaskName -Confirm:$false -ErrorAction SilentlyContinue
}

# Update Services
Write-Output "Removing Services..."
$services = "edgeupdate", "edgeupdatem"
foreach ($service in $services) {
    Stop-Service -Name $service -ErrorAction SilentlyContinue
    Remove-Service -Name $service -ErrorAction SilentlyContinue
    Remove-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\$service" -ErrorAction SilentlyContinue
}

# Remove APPX packages
Write-Output "Removing APPX Packages..."
$packages = Get-AppxPackage -AllUsers | Where-Object { $_.PackageFullName -like '*microsoftedge*' }
foreach ($package in $packages) {
    $app = $package.PackageFullName
    $userSid = (New-Object System.Security.Principal.NTAccount($env:USERNAME)).Translate([System.Security.Principal.SecurityIdentifier]).Value
    $keys = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\$userSid\$app",
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\$app",
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\$app"
    )
    foreach ($key in $keys) {
        New-Item -Path $key -Force -ErrorAction SilentlyContinue
    }
    Remove-AppxPackage -Package $app -AllUsers -ErrorAction SilentlyContinue
}

Write-Output "Cleanup Completed."
