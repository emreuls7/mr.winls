# Menü işlevini tanımlar
function Show-Menu {
    cls
    Write-Host "------------------------------------------------" -ForegroundColor Green
    Write-Host "---    Pasha Lefkosa Tiger3 Install          ---" -ForegroundColor Green
    Write-Host "------------------------------------------------" -ForegroundColor Green
    Write-Host "[1] Windows Credentials 192.168.13.3 add" -ForegroundColor Cyan
    Write-Host "[2] Tiger3 PASHA Copy C" -ForegroundColor Cyan
    Write-Host "[3] Tiger3 2015-2019 Copy C" -ForegroundColor Cyan
    Write-Host "[4] Tiger3 2019 Copy C" -ForegroundColor Cyan
    Write-Host "[5] Tiger3 2022 Copy C" -ForegroundColor Cyan
    Write-Host "------------------------------------------------" -ForegroundColor Green
    Write-Host "[6] Windows Credentials 192.168.48.4 add" -ForegroundColor Cyan
    Write-Host "[7] Tiger3 AKUN Copy C" -ForegroundColor Cyan
    Write-Host "------------------------------------------------" -ForegroundColor Green
    Write-Host "[11] License Tiger3 PASHA" -ForegroundColor Cyan
    Write-Host "[12] License Tiger3 2015-2019" -ForegroundColor Cyan
    Write-Host "[13] License Tiger3 2019" -ForegroundColor Cyan
    Write-Host "[14] License Tiger3 2022" -ForegroundColor Cyan
    Write-Host "------------------------------------------------" -ForegroundColor Green
    Write-Host "[15] License Tiger3 AKUN" -ForegroundColor Cyan
    Write-Host "[21] LHOSVR Windows host" -ForegroundColor Cyan
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "------------------------------------------------" -ForegroundColor Green
}

# Kullanıcıdan seçim almak için işlev
function Get-UserChoice {
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    return $choice
}

# Her seçimden sonra kullanıcıyı duraklatmak için işlev
function Pause-Screen {
    Read-Host "Press Enter to continue..."
}

# Windows Credentials ekleme
function Add-Credentials {
    param (
        [string]$server,
        [string]$user,
        [string]$password
    )
    cmdkey /add:$server /user:$user /pass:$password
    Write-Host "Windows Credentials for $server added."
}

# Dosya kopyalama işlemleri
function Copy-Files {
    param (
        [string]$source,
        [string]$destination
    )
    robocopy $source $destination /E /IS
    Write-Host "Files copied from $source to $destination."
}

# License Dosyası Kopyalama
function Copy-License {
    param (
        [string]$source,
        [string]$destination
    )
    robocopy $source $destination License.Dat /IS
    Write-Host "*AFFERIM LISANSI YAPTIN TEBRIK EDRIM ..."
}

# Ana menüyü döngü içinde çalıştırır
do {
    Show-Menu
    $choice = Get-UserChoice

    switch ($choice) {
        "1" { Add-Credentials -server "192.168.13.3" -user "grandpasha" -password "grand2013" }
        "2" { Copy-Files -source "\\192.168.13.3\tiger3_share\TIGER3_PASHA" -destination "C:\TIGER3\TIGER3_PASHA" }
        "3" { Copy-Files -source "\\192.168.13.3\tiger3_share\TIGER3_2015-2019" -destination "C:\TIGER3\TIGER3_2015-2019" }
        "4" { Copy-Files -source "\\192.168.13.3\tiger3_share\TIGER3_2019" -destination "C:\TIGER3\TIGER3_2019" }
        "5" { Copy-Files -source "\\192.168.13.3\tiger3_share\TIGER3_2022" -destination "C:\TIGER3\TIGER3_2022" }
        "6" { Add-Credentials -server "192.168.48.4" -user "grandpasha" -password "grand2013" }
        "7" { Copy-Files -source "\\192.168.48.4\tiger3_share\TIGER3_AKUN" -destination "C:\TIGER3\TIGER3_AKUN" }
        "11" { Copy-License -source "\\192.168.13.3\tiger3_share\TIGER3_PASHA" -destination "C:\TIGER3\TIGER3_PASHA" }
        "12" { Copy-License -source "\\192.168.13.3\tiger3_share\TIGER3_2015-2019" -destination "C:\TIGER3\TIGER3_2015-2019" }
        "13" { Copy-License -source "\\192.168.13.3\tiger3_share\TIGER3_2019" -destination "C:\TIGER3\TIGER3_2019" }
        "14" { Copy-License -source "\\192.168.13.3\tiger3_share\TIGER3_2022" -destination "C:\TIGER3\TIGER3_2022" }
        "15" { Copy-License -source "\\192.168.48.4\tiger3_share\TIGER3_AKUN" -destination "C:\TIGER3\TIGER3_AKUN" }
        "21" { Start-Process "\\192.168.13.3\muhasebe\License\TIGER3_HOST" -Wait }
        "0" { Write-Host "Goodbye!" -ForegroundColor Red; exit }
        default { Write-Host "Invalid choice. Please select a valid option." -ForegroundColor Red }
    }
    Pause-Screen
} while ($true)
