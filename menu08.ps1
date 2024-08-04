function Show-Menu {
    cls
    Write-Host "--------------------------------------------------------------"
    Write-Host "--- menu_08 --- Media Player Install ---                   ---" -ForegroundColor Red
    Write-Host "--------------------------------------------------------------"
    Write-Host "[1]  VLC media player"
    Write-Host "[2]  MPC-HC"
    Write-Host "[3]  Kodi"
    Write-Host "[4]  GOM Player"
    Write-Host "[5]  AIMP"
    Write-Host "[6]  Winamp"
    Write-Host "[7]  BSPlayer Free"
    Write-Host "[8]  iTunes"
    Write-Host "[9]  IPTV Nator"
    Write-Host "[10] Spotify"
    Write-Host "[11] YouTube Music Desktop"
    Write-Host "--------------------------------------------------------------"
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "--------------------------------------------------------------"
}

function Install-Software {
    param (
        [string]$id
    )
    
    winget install --id $id -e --accept-package-agreements --accept-source-agreements --silent
}

# Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

    switch ($choice) {
        1 { Install-Software -id "VideoLAN.VLC" }
        2 { Install-Software -id "clsid2.mpc-hc" }
        3 { Install-Software -id "XBMCFoundation.Kodi" }
        4 { Install-Software -id "GOMLab.GOMPlayer" }
        5 { Install-Software -id "AIMP.AIMP" }
        6 { Install-Software -id "Winamp.Winamp" }
        7 { Start-Process choco -ArgumentList "install bsplayer -y" -Wait }
        8 { Install-Software -id "Apple.iTunes" }
        9 {
            Write-Host "------------------------------------------------------------------------"
            Write-Host "Turk Kanallari Legal IPTV Playlist [Otomatik Gucelleme] - 2024 AKTIF"
            Write-Host "http://stream.tvcdn.net/lists/tr.m3u"
            Write-Host "http://stream.tvcdn.net/lists/tr-alt.m3u"
            Write-Host "http://stream.tvcdn.net/lists/tr-ss.m3u"
            Write-Host "------------------------------------------------------------------------"
            Write-Host "Grouped by category"
            Write-Host "https://iptv-org.github.io/iptv/index.category.m3u"
            Write-Host "Grouped by language"
            Write-Host "https://iptv-org.github.io/iptv/index.language.m3u"
            Write-Host "Grouped by country"
            Write-Host "https://iptv-org.github.io/iptv/index.country.m3u"
            Write-Host "Grouped by region"
            Write-Host "https://iptv-org.github.io/iptv/index.region.m3u"
            Write-Host "------------------------------------------------------------------------"
            Install-Software -id "4gray.iptvnator"
        }
        10 { Install-Software -id "Spotify.Spotify" }
        11 { Install-Software -id "MartinFinnerup.YouTubeMusicforDesktop" }
        0 {
            exit
            # Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1").Content
        }
        default { Write-Host "Invalid choice. Please try again." }
    }
}

# Main script loop
do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    Clear-Host
    Handle-Choice -choice $choice
    if ($choice -ne 0) { Start-Sleep -Seconds 2 }
} while ($choice -ne 0)
