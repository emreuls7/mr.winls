# PowerShell script'i, SSH anahtarlarını yönetmek ve bağlantı kurmak için

# Bilinen anahtarlar dosyasının yolu
$knownHostsFile = "$env:USERPROFILE\.ssh\known_hosts"

# Eski anahtarları bilinen anahtarlar dosyasından kaldırmak için işlev
function Remove-HostKey {
    param (
        [string]$host
    )

    if (Test-Path $knownHostsFile) {
        $tempFile = [System.IO.Path]::GetTempFileName()
        $found = $false

        # Bilinen anahtarlar dosyasını okur ve anahtarı içermeyen satırları geçici dosyaya yazar
        Get-Content $knownHostsFile | ForEach-Object {
            if ($_ -match "$host") {
                $found = $true  # Anahtar bulundu
            } else {
                Add-Content -Path $tempFile -Value $_  # Satırı geçici dosyaya ekler
            }
        }

        # Eski dosyayı yeni dosya ile değiştirir
        if ($found) {
            Move-Item -Path $tempFile -Destination $knownHostsFile -Force
            Write-Output "Eski anahtar $host için kaldırıldı."
        } else {
            Remove-Item -Path $tempFile -Force
            Write-Output "Anahtar bulunamadı: $host."
        }
    } else {
        Write-Output "Bilinen anahtarlar dosyası bulunamadı."
    }
}

# IP adresini girer ve SSH anahtarını günceller
$ip_address = Read-Host "İlk IP adresini girin"

# İlk IP adresi için anahtarları kaldırır
Remove-HostKey -host $ip_address

# İkinci IP adresini girer ve SSH bağlantısını kurar
$ip_address2 = Read-Host "İkinci IP adresini girin"
$user = "root"  # Kullanıcı adını buraya girin
$password = "YourPasswordHere"  # Şifreyi buraya girin

# Plink executable'ının yolu
$plinkPath = "C:\Path\To\plink.exe"  # Plink'in tam yolunu buraya girin

# Plink'in mevcut olup olmadığını kontrol eder
if (Test-Path $plinkPath) {
    # Plink kullanarak bağlantı kurar
    & $plinkPath -ssh "$user@$ip_address2" -pw $password -batch -noagent
} else {
    Write-Output "Plink belirtilen yolda bulunamadı. Lütfen PuTTY'yi kurun veya Plink'in doğru yolunu belirtin."
}

# Çıkışın ardından devam etmek için tuşa basmayı bekler
Read-Host -Prompt "Devam etmek için Enter'a basın..."
