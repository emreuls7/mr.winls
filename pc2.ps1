# Clear the console
Clear-Host

Write-Host "`nPress Enter to continue..."
Read-Host

Start-Sleep -Seconds 2
Clear-Host

# Function to install software using Chocolatey
function Install-ChocoPackage {
    param (
        [string]$packageName
    )
    Try {
        Write-Host "Installing $packageName..."
        choco install $packageName -y
        Write-Host "$packageName installation complete."
    } Catch {
        Write-Host "Failed to install $packageName."
    }
}

# Install .NET Frameworks
Install-ChocoPackage "dotnet3.5"
Install-ChocoPackage "dotnet4.5.1"
Install-ChocoPackage "dotnet4.5.2"

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
    "Microsoft.VCRedist.2015+.x64"
)

foreach ($redistributable in $vcRedists) {
    Try {
        Write-Host "Installing $redistributable..."
        winget install $redistributable -e
        Write-Host "$redistributable installation complete."
    } Catch {
        Write-Host "Failed to install $redistributable."
    }
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
    "Microsoft.PowerShell"
)

foreach ($app in $software) {
    Try {
        Write-Host "Installing $app..."
        winget install $app -e
        Write-Host "$app installation complete."
    } Catch {
        Write-Host "Failed to install $app."
    }
}

# Install WhatsApp
Try {
    Write-Host "Installing WhatsApp..."
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9NKSQGP7F2NH --accept-package-agreements --accept-source-agreements --silent"' -Wait
    Write-Host "WhatsApp installation complete."
} Catch {
    Write-Host "Failed to install WhatsApp."
}

# Install Windows Scan
Try {
    Write-Host "Installing Windows Scan..."
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9WZDNCRFJ3PV --accept-package-agreements --accept-source-agreements --silent"' -Wait
    Write-Host "Windows Scan installation complete."
} Catch {
    Write-Host "Failed to install Windows Scan."
}

Clear-Host
Write-Host "Upgrading installed software..."
Try {
    winget upgrade --all
    choco upgrade chocolatey
    choco upgrade all -y
    Write-Host "Software upgrade complete."
} Catch {
    Write-Host "Failed to upgrade software."
}

Clear-Host

# Set Google Chrome as the default browser
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
if (Test-Path $chromePath) {
    Write-Host "Google Chrome found at $chromePath"
    $regPathHttp = "HKCR:\http\shell\open\command"
    $regPathHttps = "HKCR:\https\shell\open\command"
    $chromeCommand = "`"$chromePath`" -- `%1`"
    Try {
        Set-ItemProperty -Path $regPathHttp -Name "(default)" -Value $chromeCommand
        Set-ItemProperty -Path $regPathHttps -Name "(default)" -Value $chromeCommand
        Write-Host "Google Chrome has been set as the default browser for HTTP and HTTPS protocols."
    } Catch {
        Write-Host "Failed to set Google Chrome as default browser."
    }
} else {
    Write-Host "Google Chrome not found at $chromePath. Please make sure it is installed."
}

Clear-Host

# Set Adobe Reader as the default PDF viewer
$adobePath = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
if (Test-Path $adobePath) {
    Write-Host "Adobe Reader found at $adobePath"
    $pdfRegistryPath = "HKCR:\.pdf\shell\open\command"
    $adobeCommand = "`"$adobePath`" `"%1`"
    Try {
        Set-ItemProperty -Path $pdfRegistryPath -Name "(default)" -Value $adobeCommand
        Write-Host "Adobe Reader has been set as the default PDF viewer."
    } Catch {
        Write-Host "Failed to set Adobe Reader as default PDF viewer."
    }
} else {
    Write-Host "Adobe Reader not found at $adobePath. Please make sure it is installed."
}

Clear-Host

# Configure VLC as the default media player
$vlcPath = "C:\Program Files\VideoLAN\VLC\vlc.exe"
if (Test-Path $vlcPath) {
    Write-Host "Configuring VLC..."
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
        Try {
            $command = "assoc $type=VLCFile"
            Invoke-Expression $command
            Write-Host "Associated $type with VLC."
        } Catch {
            Write-Host "Failed to associate $type with VLC."
        }
    }

    Try {
        $shell = New-Object -ComObject Shell.Application
        $folder = $shell.Namespace("C:\")
        $folder.ParseName($vlcPath).InvokeVerb("openas")
        Write-Host "VLC has been registered as a file type handler."
    } Catch {
        Write-Host "Failed to register VLC as a file type handler."
    }
} else {
    Write-Host "VLC not found at $vlcPath. Please make sure it is installed."
}

# Configure WinRAR as the default archiver
$winrarPath = "C:\Program Files\WinRAR\WinRAR.exe"
if (Test-Path $winrarPath) {
    Write-Host "Configuring WinRAR..."
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

    function Set-FileAssociation {
        param (
            [string]$Extension,
            [string]$ProgramPath
        )
        $progId = "WinRAR_" + $Extension.TrimStart(".")
        $regPath = "HKCU:\Software\Classes\$progId"
        Try {
            New-Item -Path $regPath -Force | Out-Null
            New-ItemProperty -Path $regPath -Name "(Default)" -Value "WinRAR $Extension" -Force | Out-Null
            New-ItemProperty -Path $regPath -Name "FriendlyTypeName" -Value "WinRAR $Extension" -Force | Out-Null
            New-Item -Path "HKCU:\Software\Classes\$progId\shell\open\command" -Force | Out-Null
            Set-ItemProperty -Path "HKCU:\Software\Classes\$progId\shell\open\command" -Name "(Default)" -Value "`"$ProgramPath`" `"%1`"" -Force
            Set-ItemProperty -Path "HKCU:\Software\Classes\$Extension" -Name "(Default)" -Value $progId
            Write-Host "Associated $Extension with WinRAR."
        } Catch {
            Write-Host "Failed to associate $Extension with WinRAR."
        }
    }

    foreach ($ext in $fileExtensions) {
        Set-FileAssociation -Extension $ext -ProgramPath $winrarPath
    }
    Write-Host "WinRAR has been set as the default application for specified file types."
} else {
    Write-Host "WinRAR not found at $winrarPath. Please make sure it is installed."
}

Clear-Host

# Install UltraVNC and configure the password
Try {
    Write-Host "Installing UltraVNC..."
    winget install --id=UltraVNC.UltraVNC --source=winget
    Start-Sleep -Seconds 30
    $installPath = "C:\Program Files\UltraVNC"
    $password = "412199"
    $regPath = "HKLM:\SOFTWARE\UltraVNC\Server"
    $regName = "Password"

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force
    }
    Set-ItemProperty -Path $regPath -Name $regName -Value $password
    Write-Host "UltraVNC has been installed and the password has been set."
} Catch {
    Write-Host "Failed to install or configure UltraVNC."
}

Clear-Host

# Update PowerShell Shortcut
$pwshPath = "C:\Program Files\PowerShell\7\pwsh.exe"
if (Test-Path $pwshPath) {
    Write-Host "Updating PowerShell shortcut..."
    $powershellShortcutPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop\Windows PowerShell.lnk")
    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($powershellShortcutPath)
    $shortcut.TargetPath = $pwshPath
    $shortcut.WorkingDirectory = [System.IO.Path]::GetDirectoryName($pwshPath)
    $shortcut.Save()
    Write-Host "PowerShell shortcut updated to point to PowerShell 7."
} else {
    Write-Host "PowerShell 7 is not installed or the path is incorrect."
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
exit
