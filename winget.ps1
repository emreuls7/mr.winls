# İlerleme bilgilerini ve mesajları göstermek için ayarlar
$ProgressPreference = 'Continue'
$VerbosePreference = 'Continue'

# Windows geçici dizin yolunu al
$tempPath = [System.IO.Path]::GetTempPath()
$downloadPath = Join-Path -Path $tempPath -ChildPath 'WinGetInstall'

# İndirme dizini varsa temizle, yoksa oluştur
if (Test-Path $downloadPath) {
    Write-Host "Cleaning up old files in $downloadPath..."
    Remove-Item -Path $downloadPath -Recurse -Force
}
Write-Host "Creating download directory $downloadPath..."
New-Item -Path $downloadPath -ItemType Directory -Force

# Bilgilendirme mesajını gösterir
Write-Host "Downloading WinGet and its dependencies to $downloadPath..."

# WinGet ve bağımlılıklarını indirir
$files = @{
    'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' = 'https://aka.ms/getwinget'
    'Microsoft.VCLibs.x64.14.00.Desktop.appx' = 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'
    'Microsoft.UI.Xaml.2.8.x64.appx' = 'https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx'
}

foreach ($file in $files.GetEnumerator()) {
    $fileName = $file.Key
    $url = $file.Value
    $outputPath = Join-Path -Path $downloadPath -ChildPath $fileName

    # Dosyanın mevcut olup olmadığını kontrol et
    if (-Not (Test-Path $outputPath)) {
        Write-Host "Downloading $fileName from $url..."
        Invoke-WebRequest -Uri $url -OutFile $outputPath -Verbose
        Write-Host "Downloaded $fileName to $outputPath"
    } else {
        Write-Host "$fileName already exists at $outputPath. Skipping download."
    }
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
    Write-Host "Installing $packagePath..."
    Add-AppxPackage -Path $packagePath -Verbose
}

Write-Host "Installation complete."
