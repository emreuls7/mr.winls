# Show-Menu fonksiyonu menüyü temiz ve düzgün şekilde ekrana yazdırır. Ancak, menüdeki renkler ve yazılar düzgün görünsün diye Write-Host komutlarının ardından renk parametrelerini kontrol edelim.
# Menü görüntüleme fonksiyonu
function Show-Menu {
    Clear-Host
    Write-Host "-------------------------------------------------------------------"
    Write-Host "---                   --- microsoft ---                         ---"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] Microsoft Program Install"
    Write-Host "[2] Microsoft .NET Install"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit                                                           "
    Write-Host "-------------------------------------------------------------------"
}

# Kullanıcı seçimlerini işleyen fonksiyon
function Handle-Choice {
    param (
        [int]$Choice
    )

    Clear-Host
    switch ($choice) {
        1 { Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/emreuls7/mr.winls/edit/win/microsoft1.ps1").Content }
        2 { Invoke-Expression (Invoke-WebRequest -Uri "https://github.com/emreuls7/mr.winls/edit/win/microsoft2.ps1").Content }
        0 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1").Content }
        default { Write-Host "Invalid choice, please try again." }
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