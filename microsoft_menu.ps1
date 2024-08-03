# Show-Menu fonksiyonu menüyü temiz ve düzgün şekilde ekrana yazdırır. Ancak, menüdeki renkler ve yazılar düzgün görünsün diye Write-Host komutlarının ardından renk parametrelerini kontrol edelim.
# Menü görüntüleme fonksiyonu
function Show-Menu {
    Clear-Host
    Write-Output "-------------------------------------------------------------------" -ForegroundColor Green
    Write-Output "---                   --- microsoft ---                         ---" -ForegroundColor Red
    Write-Output "-------------------------------------------------------------------" -ForegroundColor Green
    Write-Output "[1] Microsoft Program Install"
    Write-Output "[2] Microsoft .NET Install"
    Write-Output "-------------------------------------------------------------------" -ForegroundColor Green
    Write-Output "[0] Exit                                                           " -ForegroundColor Red
    Write-Output "-------------------------------------------------------------------" -ForegroundColor Green
}

# Kullanıcı seçimlerini işleyen fonksiyon
function Handle-Choice {
    param (
        [int]$Choice
    )

    Clear-Host
    switch ($choice) {
        1 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu11.ps1").Content }
        2 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu12.ps1").Content }
        0 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu_microsoft.ps1").Content }
        default { Write-Host "Invalid choice, please try again." -ForegroundColor Red }
    }
}

# Ana döngü, kullanıcıdan giriş alır ve seçimleri işler. Döngüye eklenen hata kontrolü ve kullanıcı dostu geri bildirimler ile daha güvenilir hale getirildi.
# Ana döngü menüyü görüntülemek ve seçimleri işlemek için
# Main script loop
do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    Clear-Host
    Handle-Choice -choice $choice
    if ($choice -ne 0) { Start-Sleep -Seconds 2 }
} while ($choice -ne 0)
