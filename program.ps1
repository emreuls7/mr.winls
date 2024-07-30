# Show-Menu fonksiyonu menüyü temiz ve düzgün şekilde ekrana yazdırır. Ancak, menüdeki renkler ve yazılar düzgün görünsün diye Write-Host komutlarının ardından renk parametrelerini kontrol edelim.


function Show-Menu {
    Clear-Host
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "--- Main Menu                  --- Welcome to Software Install ---                                 CREATED BY MRLSx7 ---" -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[1] *Program Install*                              [6]  Web Browser Install                   " -ForegroundColor White
    Write-Host "[2] Winget 1 Install                               [7]  VPN + Remote Install                  " -ForegroundColor White
    Write-Host "[3] Winget 2 Install                               [8]  Media Player Install                  " -ForegroundColor White
    Write-Host "[4] Choco Instal                                   [9]  Chat Messenger Install                " -ForegroundColor White
    Write-Host "[5] MS Store Install                               [10] Gaming Launcher Install               " -ForegroundColor White
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[11] Microsoft Program Install                     [21] * Windows Fixed *                     " -ForegroundColor White                   
    Write-Host "[12] Microsoft .NET Install                        [22] * Microsoft Fixed *                   " -ForegroundColor Yellow
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[31] Setup Program Install ISO + EXE               [41] *** Winget Install ***                " -ForegroundColor Blue
    Write-Host "[32] Setup Microsoft Office Install EXE            [42] *** Chocolatey Install ***            " -ForegroundColor Blue
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[90] *** Standard PC Install All in One ***        [91] Winget + Chocolatey Upgrade           " -ForegroundColor DarkRed
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[98] Windows Utility (winutil)                     [99] Microsoft Activation Scripts (MAS)    " -ForegroundColor DarkGray
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
    Write-Host "[0] Exit                                                                                      " -ForegroundColor Red
    Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Green
}


# Download-And-Execute-Script fonksiyonu, bir URL'den script indirme ve çalıştırma işlemini gerçekleştirir. Buradaki düzeltmeler, Invoke-WebRequest ve Invoke-Expression komutlarının nasıl kullanıldığını doğrulamayı içerir.


function Get-And-cmd-Run-Script {
    param (
        [string]$Url
    )
    
    try {
        Write-Host "Downloading script from $Url..." -ForegroundColor Yellow
        
        # Script içeriğini al
        $scriptContent = Invoke-WebRequest -Uri $Url
        $scriptContent = $scriptContent.Content

        Write-Host "Executing script..." -ForegroundColor Yellow
        
        # İçeriği bir değişkende sakla ve çalıştır
        Invoke-Expression $scriptContent
        
    } catch {
        Write-Host "An error occurred while processing the script: $_" -ForegroundColor Red
    }
}

function Get-And-ps1-Run-Script {
    param (
        [string]$Url,
        [string]$LocalPath = "$env:TEMP\script.ps1"  # Varsayılan olarak geçici dizine kaydedilecek
    )
    
    try {
        Write-Host "Downloading script from $Url..." -ForegroundColor Yellow
        
        # Script içeriğini indir ve dosyaya kaydet
        Invoke-WebRequest -Uri $Url -OutFile $LocalPath

        Write-Host "Script downloaded successfully to $LocalPath." -ForegroundColor Green
        
        Write-Host "Executing script..." -ForegroundColor Yellow
        
        # Scripti çalıştır
        & $LocalPath
        
    } catch {
        Write-Host "An error occurred while processing the script: $_" -ForegroundColor Red
    }
}


# Örnek kullanım - URL ve dosya yolunu belirleyin
# $scriptUrl = "https://raw.githubusercontent.com/emreuls7/mr.winls/tool/example.ps1"
# $localFilePath = "$env:TEMP\example.ps1"

# Fonksiyonu çağırın
# Get-And-ps1-Run-Script -Url $scriptUrl -LocalPath $localFilePath



# Handle-Choice fonksiyonu, kullanıcı seçimlerine göre farklı scriptleri indirir ve çalıştırır. Aşağıdaki düzeltmeleri yaptım:
# Invoke-WebRequest ve Invoke-Expression komutlarının doğru kullanımı.
# Set-ExecutionPolicy ve SecurityProtocol ayarlarının doğru yapılması.
# Eksik ve hatalı URL'lerin düzeltilmesi.

function Handle-Choice {
    param (
        [int]$Choice
    )
    
    switch ($Choice) {
        1 { Get-And-ps1-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu01.ps1" }
        2 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu02.cmd" }
        3 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu03.cmd" }
        4 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu04.cmd" }
        5 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu05.cmd" }
        6 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu06.cmd" }
        7 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu07.cmd" }
        8 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu08.cmd" }
        9 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu09.cmd" }
        10 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu10.cmd" }
        11 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu11.cmd" }
        12 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu12.cmd" }
        21 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21.cmd" }
        22 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu22.cmd" }
        31 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu31.cmd" }
        32 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu32.cmd" }
        41 { 
            Write-Host "*** Winget Install ***." -ForegroundColor Blue
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
            iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/winget.ps1'))
        }
        42 { 
            Write-Host "*** Chocolatey Install ***." -ForegroundColor Blue
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
            iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/emreuls7/mr.winls/tool/chocolatey.ps1'))
        }
        88 { 
            Write-Host "Functionality not implemented yet." -ForegroundColor Yellow
        }
        90 { Get-And-cmd-Run-Script -Url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90.cmd" }
        91 { 
            Write-Host "Updating packages with Winget and Chocolatey." -ForegroundColor Yellow
            winget upgrade --all
            choco upgrade chocolatey -y
            choco upgrade all -y
        }
        98 { 
            Write-Host "You chose Windows Utility (winutil)." -ForegroundColor Cyan
            $scriptUrl = "https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/winutil.ps1"
            $scriptContent = Invoke-WebRequest -Uri $scriptUrl
            $scriptContent = $scriptContent.Content
            Invoke-Expression $scriptContent
        }
        99 { 
            Write-Host "You chose Microsoft Activation Scripts (MAS)." -ForegroundColor Cyan
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            $scriptUrl = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/0884271c4fcdc72d95bce7c5c7bdf77ef4a9bcef/MAS/All-In-One-Version/MAS_AIO-CRC32_31F7FD1E.cmd"
            $scriptContent = Invoke-WebRequest -Uri $scriptUrl
            $scriptContent = $scriptContent.Content
            # CMD scriptini çalıştır
            Invoke-Expression $scriptContent
        }
        0 { 
            Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Cyan
            Write-Host "--- Exit                      --- Thank you for using Software Installer ---                       CREATED BY MRLSx7 ---" -ForegroundColor Red
            Write-Host "------------------------------------------------------------------------------------------------------------------------" -ForegroundColor Cyan
            Write-Host "Exiting..." -ForegroundColor Green
            Start-Sleep -Seconds 2
            exit
        }
        default { Write-Host "Invalid choice, please try again." -ForegroundColor Red }
    }
}



# Ana döngü, kullanıcıdan giriş alır ve seçimleri işler. Döngüye eklenen hata kontrolü ve kullanıcı dostu geri bildirimler ile daha güvenilir hale getirildi.

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
        Read-Host "Press Enter to return to the main menu"
    }
} while ($choice -ne 0)

