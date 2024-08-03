# Ekranı temizleyip menüyü gösteren fonksiyon
function Show-Menu {
    Clear-Host
    Write-Output "-------------------------------------------------------------------"
    Write-Output "---            --- * Windows Fixed * ---                        ---"
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[1] menu_21_1 System file Fixed"
    Write-Output "[2] menu_21_2"
    Write-Output "[3] menu_21_3"
    Write-Output "[4] menu_21_4 OUTLOOK FIX"
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[0] Exit"
    Write-Output "-------------------------------------------------------------------"
}

# Kullanıcı seçimlerini işleyen fonksiyon
function Handle-Choice {
    param (
        [int]$choice
    )

    # Script kaynakları için temel URL
    $baseUrl = "https://raw.githubusercontent.com/emreuls7/mr.winls/win/"

    # Kullanıcı seçimlerini işleme
    switch ($choice) {
        1 { $scriptUrl = "${baseUrl}fix1.ps1" }
        2 { $scriptUrl = "${baseUrl}fix2.ps1" }
        3 { $scriptUrl = "${baseUrl}fix3.ps1" }
        4 { $scriptUrl = "${baseUrl}fix4.ps1" }
        0 { $scriptUrl = "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1" }
        default {
            Write-Output "Geçersiz seçim. Lütfen geçerli bir seçenek girin."
            return
        }
    }

    # Script'i alıp çalıştırma
    try {
        $scriptContent = Invoke-WebRequest -Uri $scriptUrl -ErrorAction Stop
        Invoke-Expression $scriptContent.Content
        Write-Output "Script başarıyla çalıştırıldı."
    } catch {
        Write-Output "Script'i almak veya çalıştırmak başarısız oldu. Lütfen daha sonra tekrar deneyin."
    }
}

# Ana betik döngüsü
do {
    Show-Menu
    $choice = Read-Host "Seçiminizi girin (0,1,2,3...)"
    Clear-Host
    Handle-Choice -choice $choice
    if ($choice -ne 0) { 
        Start-Sleep -Seconds 2 
    }
} while ($choice -ne 0)
