# Show-Menu fonksiyonu menüyü temiz ve düzgün şekilde ekrana yazdırır. Ancak, menüdeki renkler ve yazılar düzgün görünsün diye Write-Host komutlarının ardından renk parametrelerini kontrol edelim.
# Menü görüntüleme fonksiyonu
function Show-Menu {
    Clear-Host
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "--- Main Menu                  --- Welcome to Software Install ---                                 CREATED BY MRLSx7 ---" -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[1] Program Install *                              [6]  Web Browser Install               " -ForegroundColor DarkGray
    Write-Host "[2] Winget 1* Install                              [7]  VPN + Remote Install              " -ForegroundColor DarkGray
    Write-Host "[3] Winget 2* Install                              [8]  Media Player Install              " -ForegroundColor DarkGray
    Write-Host "[4] Choco Instal                                   [9]  Chat Messenger Install            " -ForegroundColor DarkGray
    Write-Host "[5] MS Store Install                               [10] Gaming Launcher Install           " -ForegroundColor DarkGray
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[11] Microsoft Windows Menu                        [15] *Standard PC Install              " -ForegroundColor DarkGray                    
    Write-Host "[22] *Microsoft Windows Fixed                      [16] *Pasha Lefkosa Other              " -ForegroundColor DarkGray
    Write-Host "[13] Setup Program Install ISO + EXE               [17] Winget Install *                  " -ForegroundColor DarkGray
    Write-Host "[14] Setup Microsoft Office Install EXE            [18] Chocolatey Install *              " -ForegroundColor DarkGray
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[98] Windows Utility (winutil)                     [99] Microsoft Activation Scripts (MAS)" -ForegroundColor DarkGray
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[0] Exit                                                                                   " -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
}


# Download-And-Execute-Script fonksiyonu, bir URL'den script indirme ve çalıştırma işlemini gerçekleştirir. 
#Buradaki düzeltmeler, Invoke-WebRequest ve Invoke-Expression komutlarının nasıl kullanıldığını doğrulamayı içerir.

# Script indirme ve çalıştırma fonksiyonu
function Download-And-Execute-Script {
    param (
        [string]$Url
    )
    
    $tempFile = [System.IO.Path]::GetTempFileName() + ".cmd"
    try {
        Write-Host "Downloading script from $Url..." -ForegroundColor Green
        Invoke-WebRequest -Uri $Url -OutFile $tempFile
        Write-Host "Script downloaded to $tempFile" -ForegroundColor Green
        
        Write-Host "Executing script..." -ForegroundColor Green
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$tempFile`"" -Wait -NoNewWindow
    } catch {
        Write-Host "An error occurred while processing the script: $_" -ForegroundColor Red
    } finally {
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force
            Write-Host "Temporary file removed." -ForegroundColor Green
        }
    }
}



# Handle-Choice fonksiyonu, kullanıcı seçimlerine göre farklı scriptleri indirir ve çalıştırır. Aşağıdaki düzeltmeleri yaptım:
# Invoke-WebRequest ve Invoke-Expression komutlarının doğru kullanımı.
# Set-ExecutionPolicy ve SecurityProtocol ayarlarının doğru yapılması.
# Eksik ve hatalı URL'lerin düzeltilmesi.

# Kullanıcı seçimlerini işleyen fonksiyon
function Handle-Choice {
    param (
        [int]$Choice
    )

    Clear-Host
    switch ($Choice) {
        1 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu01.ps1").Content }
        2 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu02.ps1").Content }
        3 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu03.ps1").Content }
        4 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu04.ps1").Content }
        5 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu05.ps1").Content }
        6 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu06.ps1").Content }
        7 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu07.ps1").Content }
        8 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu08.ps1").Content }
        9 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu09.ps1").Content }
        10 {
        Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/ps1/menu10.ps1").Content 
        }
        11 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/microsoft_menu.ps1").Content }
        22 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/fix.ps1").Content }
        13 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/menu_iso.ps1").Content }
        14 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/menu_office.ps1").Content }
        15 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pc.ps1").Content }
        16 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pasha_menu.ps1").Content }
        17 { 
            Write-Host "*** Winget Install ***." -ForegroundColor Blue
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
            iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1'))
            winget upgrade --all
        }
        18 { 
            Write-Host "*** Chocolatey Install ***." -ForegroundColor Blue
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1'))
            choco upgrade chocolatey -y; choco upgrade all -y
        }

        98 { 
            Write-Host "You chose Windows Utility (winutil)." -ForegroundColor Cyan
            Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/winutil.ps1").Content
        }
        99 { 
            Write-Host "You chose Microsoft Activation Scripts (MAS)." -ForegroundColor Cyan
            Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1").Content
        }
        0 { 
            # Clear the screen
            Clear-Host

            # Display the exit message
            Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Cyan
            Write-Host "--- Exit                      --- Thank you for using Software Installer ---                       CREATED BY MRLSx7 ---" -ForegroundColor Red
            Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Cyan

            # Wait for 2 seconds
            Start-Sleep -Seconds 2

            # Exit the script
            exit
        }
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

