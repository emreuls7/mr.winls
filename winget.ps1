# Set preferences for displaying progress and verbose messages
$ProgressPreference = 'Continue'
$VerbosePreference = 'Continue'

# Get the Windows temporary directory path
$tempPath = 'C:\Windows\Temp'
$downloadPath = Join-Path -Path $tempPath -ChildPath 'WinGetInstall'

# Create the download directory if it doesn't exist
if (-Not (Test-Path $downloadPath)) {
    Write-Host "Creating download directory $downloadPath..."
    New-Item -Path $downloadPath -ItemType Directory -Force
}

# Informative message about checking and downloading files
Write-Host "Checking for existing files and downloading missing ones to $downloadPath..."

# Define the files to download with their URLs
$files = @{
    'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' = 'https://aka.ms/getwinget'
    'Microsoft.VCLibs.x64.14.00.Desktop.appx' = 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'
    'Microsoft.UI.Xaml.2.8.x64.appx' = 'https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx'
}

# Check for existing files
$allFilesExist = $true
foreach ($file in $files.Keys) {
    $outputPath = Join-Path -Path $downloadPath -ChildPath $file
    if (-Not (Test-Path $outputPath)) {
        $allFilesExist = $false
        Write-Host "$file is missing. It will be downloaded."
    } else {
        Write-Host "$file already exists at $outputPath. Skipping download."
    }
}

if (-Not $allFilesExist) {
    # Download missing files
    foreach ($file in $files.GetEnumerator()) {
        $fileName = $file.Key
        $url = $file.Value
        $outputPath = Join-Path -Path $downloadPath -ChildPath $fileName

        if (-Not (Test-Path $outputPath)) {
            Write-Host "Downloading $fileName from $url..."
            try {
                Invoke-WebRequest -Uri $url -OutFile $outputPath -Verbose
                Write-Host "Downloaded $fileName to $outputPath"
            } catch {
                Write-Host "Failed to download $fileName from $url. $_"
            }
        }
    }
} else {
    Write-Host "All required files already exist. Skipping download."
}

# Install the downloaded packages
Write-Host "Installing downloaded packages..."

$packages = @(
    'Microsoft.VCLibs.x64.14.00.Desktop.appx',
    'Microsoft.UI.Xaml.2.8.x64.appx',
    'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
)

foreach ($package in $packages) {
    $packagePath = Join-Path -Path $downloadPath -ChildPath $package
    if (Test-Path $packagePath) {
        Write-Host "Installing $packagePath..."
        try {
            Add-AppxPackage -Path $packagePath -Verbose
        } catch {
            Write-Host "Failed to install $packagePath. $_"
        }
    } else {
        Write-Host "Package $packagePath not found. Skipping installation."
    }
}

Write-Host "Installation complete."
