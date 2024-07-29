            # Güvenlik protokolünü TLS 1.2 olarak ayarla
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

            # Script'in URL'sini tanımla
            $scriptUrl = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/0884271c4fcdc72d95bce7c5c7bdf77ef4a9bcef/MAS/All-In-One-Version/MAS_AIO-CRC32_31F7FD1E.cmd"

            # Script'in kaydedileceği yolu tanımla
            $scriptPath = "$env:TEMP\MAS_AIO-CRC32_31F7FD1E.cmd"

            # Script'i indir
            Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

            # İsteğe bağlı olarak indirilen script'in içeriğini görüntüle
            # Get-Content $scriptPath | Out-Host

            # Script'i çalıştır
            Invoke-Expression -Command "& `$scriptPath"
