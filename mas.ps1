# Daha eski istemcilerle uyumluluk için TLSv1.2'yi etkinleştir
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# İndirilecek URL'ler
$DownloadURL1 = 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/mas.cmd'
$DownloadURL2 = 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/mas.cmd'

$URLs = @($DownloadURL1, $DownloadURL2)
$RandomURL1 = Get-Random -InputObject $URLs
$RandomURL2 = $URLs | Where-Object { $_ -ne $RandomURL1 }

$response = $null

try {
    # İlk URL'den script'i indir
    $response = Invoke-WebRequest -Uri $RandomURL1 -UseBasicParsing
}
catch {
    try {
        # İlk URL başarısız olursa, ikinci URL'den script'i indir
        $response = Invoke-WebRequest -Uri $RandomURL2 -UseBasicParsing
    }
    catch {
        Write-Error "Her iki URL'den de script indirilemedi."
        exit 1
    }
}

# Benzersiz bir GUID oluştur
$rand = [Guid]::NewGuid().Guid

# Yönetici olup olmadığını kontrol et
$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')

# Dosya yolunu belirle
$FilePath = if ($isAdmin) { "$env:SystemRoot\Temp\MAS.cmd" } else { "$env:TEMP\MAS.cmd" }

# Script argümanlarını ve içeriği ayarla
$ScriptArgs = "$args "
$prefix = "@::: $rand `r`n"
$content = $prefix + $response.Content

# İçeriği dosyaya yaz
Set-Content -Path $FilePath -Value $content

# Geçici dosyayı çalıştır
$env:ComSpec = "$env:SystemRoot\system32\cmd.exe"
Start-Process cmd.exe "/c """"$FilePath"" $ScriptArgs""" -Wait

# Geçici dosyaları temizle
$FilePaths = @("$env:TEMP\MAS.cmd", "$env:SystemRoot\Temp\MAS.cmd")
foreach ($FilePath in $FilePaths) {
    if (Test-Path $FilePath) {
        Remove-Item -Path $FilePath -Force
    }
}
