function Show-Menu {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "---          --- Chat Messenger Install ---                     ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1]  WhatsApp"
    Write-Host "[2]  WhatsApp Beta"
    Write-Host "[3]  Telegram Desktop"
    Write-Host "[4]  Telegram Desktop Beta"
    Write-Host "[5]  Discord"
    Write-Host "[6]  Skype"
    Write-Host "[7]  WeChat"
    Write-Host "[8]  Zoom"
    Write-Host "[9]  Viber"
    Write-Host "[10] Signal"
    Write-Host "[11] Signal Beta"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
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
        "1" { Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9NKSQGP7F2NH --accept-package-agreements --accept-source-agreements --silent"' -Wait }
        "2" { Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "winget install -e --id 9NBDXK71NK08 --accept-package-agreements --accept-source-agreements --silent"' -Wait }
        "3" { Install-Software -id "Telegram.TelegramDesktop" }
        "4" { Install-Software -id "Telegram.TelegramDesktop.Beta" }
        "5" { Install-Software -id "Discord.Discord" }
        "6" { Install-Software -id "Microsoft.Skype" }
        "7" { Install-Software -id "Tencent.WeChat" }
        "8" { Install-Software -id "Zoom.Zoom" }
        "9" { Install-Software -id "Viber.Viber" }
        "10" { Install-Software -id "OpenWhisperSystems.Signal" }
        "11" { Install-Software -id "OpenWhisperSystems.Signal.Beta" }
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

