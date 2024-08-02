# Show-Menu fonksiyonu menüyü temiz ve düzgün şekilde ekrana yazdırır. Ancak, menüdeki renkler ve yazılar düzgün görünsün diye Write-Host komutlarının ardından renk parametrelerini kontrol edelim.
# Menü görüntüleme fonksiyonu
function Show-Menu {
    Clear-Host
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "--- Main Menu                  --- Welcome to Software Install ---                                 CREATED BY MRLSx7 ---" -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[1] * Program Install *                            [6]  Web Browser Install               " -ForegroundColor DarkGray
    Write-Host "[2] Winget 1* Install                              [7]  VPN + Remote Install              " -ForegroundColor DarkGray
    Write-Host "[3] Winget 2* Install                              [8]  Media Player Install              " -ForegroundColor DarkGray
    Write-Host "[4] Choco Instal                                   [9]  Chat Messenger Install            " -ForegroundColor DarkGray
    Write-Host "[5] MS Store Install                               [10] Gaming Launcher Install           " -ForegroundColor DarkGray
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[11] Microsoft Program Install                     [21] * Microsoft Windows Fixed *       " -ForegroundColor DarkGray                    
    Write-Host "[12] Microsoft .NET Install                                                               " -ForegroundColor DarkGray
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[31] Setup Program Install ISO + EXE               [41] * Winget Install *                " -ForegroundColor DarkGray
    Write-Host "[32] Setup Microsoft Office Install EXE            [42] * Chocolatey Install *            " -ForegroundColor DarkGray
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[90] *** Standard PC Install All in One ***        [91] Winget + Chocolatey Upgrade       " -ForegroundColor DarkGray
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
        1 { 
        Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu01.ps1").Content 
        }
        2 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu02.ps1").Content }
        3 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu03.ps1").Content }
        4 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu04.ps1").Content }
        5 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu05.ps1").Content }
        6 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu06.ps1").Content }
        7 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu07.ps1").Content }
        8 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu08.ps1").Content }
        9 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu09.ps1").Content }
        10 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu10.ps1").Content }
        11 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu11.ps1").Content }
        12 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu12.ps1").Content }
        21 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21.ps1").Content }
        22 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu22.ps1").Content }
        31 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu32.ps1").Content }
        32 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu32.ps1").Content }
        41 { 
            Write-Host "*** Winget Install ***." -ForegroundColor Blue
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
            iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1'))
        }
        42 { 
            Write-Host "*** Chocolatey Install ***." -ForegroundColor Blue
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1'))
        }
        90 { Download-And-Execute-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90.cmd" }
        91 { winget upgrade --all; choco upgrade chocolatey -y; choco upgrade all -y }
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
            Write-Host "Exiting..." -ForegroundColor Green

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

