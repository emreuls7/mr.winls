# Show-Menu fonksiyonu menüyü temiz ve düzgün şekilde ekrana yazdırır. Ancak, menüdeki renkler ve yazılar düzgün görünsün diye Write-Host komutlarının ardından renk parametrelerini kontrol edelim.
# Menü görüntüleme fonksiyonu
function Show-Menu {
    Clear-Host
    Write-Output "-------------------------------------------------------------------" -ForegroundColor Green
    Write-Output "--- menu_21      --- DEFAULT PC INSTALL ---                     ---" -ForegroundColor Red
    Write-Output "-------------------------------------------------------------------" -ForegroundColor Green
    Write-Output "[1] USER DEFAULT SET"
    Write-Output "[2] INSTALL DEFAULT"
    Write-Output "-------------------------------------------------------------------" -ForegroundColor Green
    Write-Output "[0] Exit" -ForegroundColor Red
    Write-Output "-------------------------------------------------------------------" -ForegroundColor Green
}

# Kullanıcı seçimlerini işleyen fonksiyon
function Handle-Choice {
    param (
        [int]$Choice
    )

    Clear-Host
    switch ($choice) {
        1 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90_1.ps1").Content }
        2 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90_2.ps1").Content }
        0 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1").Content }
        default { Write-Host "Invalid choice, please try again." -ForegroundColor Red }
    }
}

# Ana döngü, kullanıcıdan giriş alır ve seçimleri işler. Döngüye eklenen hata kontrolü ve kullanıcı dostu geri bildirimler ile daha güvenilir hale getirildi.

# Ana döngü menüyü görüntülemek ve seçimleri işlemek için
do {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    if ($choice -match '^\d+$') {
        $choice = [int]$choice
        Handle-Choice -Choice $choice
    } else {
        Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
    }
    if ($choice -ne 0) {
        # Menüden çıkış yapıldıysa ekranı temizle
        Clear-Host
        # Start-Sleep -Seconds 1  # 1 saniye bekler ve ardından ana menüye döner
        # Read-Host "Press Enter to return to the main menu"
    }
} while ($choice -ne 0)
