# TLSv1.2'yi etkinleştirerek uyumlu bağlantılar sağlanır
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$DownloadURL1 = 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/mas.cmd'
$DownloadURL2 = 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/mas.cmd'

$URLs = @($DownloadURL1, $DownloadURL2)
$RandomURL1 = Get-Random -InputObject $URLs
$RandomURL2 = $URLs | Where-Object { $_ -ne $RandomURL1 }

try {
    $response = Invoke-WebRequest -Uri $RandomURL1 -UseBasicParsing
}
catch {
    $response = Invoke-WebRequest -Uri $RandomURL2 -UseBasicParsing
}

$rand = [Guid]::NewGuid().ToString()
$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')
$FilePath = if ($isAdmin) { "$env:SystemRoot\Temp\MAS.cmd" } else { "$env:TEMP\MAS.cmd" }

$ScriptArgs = "$args "
$prefix = "@::: $rand `r`n"
$content = $prefix + $response.Content
Set-Content -Path $FilePath -Value $content

# Komut işlem değişkenini mevcut oturum için ayarlayın
$env:ComSpec = "$env:SystemRoot\system32\cmd.exe"
Start-Process cmd.exe "/c `"$FilePath`" $ScriptArgs" -Wait

# Dosyaları temizle
$FilePaths = @("$env:TEMP\MAS.cmd", "$env:SystemRoot\Temp\MAS.cmd")
foreach ($FilePath in $FilePaths) {
    if (Test-Path $FilePath) {
        Remove-Item -Path $FilePath -Force
    }
}
