# İlerleme bilgilerini ve mesajları göstermek için ayarlar
$ProgressPreference = 'Continue'
$VerbosePreference = 'Continue'

# Windows geçici dizin yolunu al
$tempPath = [System.IO.Path]::GetTempPath()
$downloadPath = Join-Path -Path $tempPath -ChildPath 'WinGetInstall'

# İndirme dizinini oluştur
if (-Not (Test-Path $downloadPath)) {
    Write-Host "Creating download directory $downloadPath..."
    New-Item -Path $downloadPath -ItemType Directory -Force
}

# Bilgilendirme mesajını gösterir
Write-Host "Checking for existing files and downloading missing ones to $downloadPath..."

# WinGet ve bağımlılıklarını indirir
$files = @{
    'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' = 'https://aka.ms/getwinget'
    'Microsoft.VCLibs.x64.14.00.Desktop.appx' = 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'
    'Microsoft.UI.Xaml.2.8.x64.appx' = 'https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx'
}

# Mevcut dosyaları kontrol et
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
    # Eksik dosyalar varsa indir
    foreach ($file in $files.GetEnumerator()) {
        $fileName = $file.Key
        $url = $file.Value
        $outputPath = Join-Path -Path $downloadPath -ChildPath $fileName

        if (-Not (Test-Path $outputPath)) {
            Write-Host "Downloading $fileName from $url..."
            Invoke-WebRequest -Uri $url -OutFile $outputPath -Verbose
            Write-Host "Downloaded $fileName to $outputPath"
        }
    }
} else {
    Write-Host "All required files already exist. Skipping download."
}

# İndirilen paketleri yükler
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
        Add-AppxPackage -Path $packagePath -Verbose
    } else {
        Write-Host "Package $packagePath not found. Skipping installation."
    }
}

Write-Host "Installation complete."
