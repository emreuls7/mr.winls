
function Show-Menu {
    Clear-Host
    Write-Host "-------------------------------------------------------------------"
    Write-Host "---            --- * Windows Fixed * ---                        ---"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] menu_21_1 System file Fixed"
    Write-Host "[2] menu_21_2"
    Write-Host "[3] menu_21_3"
    Write-Host "[4] menu_21_4 OUTLOOK FIX"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit"
    Write-Host "-------------------------------------------------------------------"
}

function Download-And-Execute-Script {
    param (
        [string]$Url
    )
    
    # Geçici dosya yolunu oluştur
    $tempFile = [System.IO.Path]::Combine("C:\Windows\Temp", [System.IO.Path]::GetRandomFileName() + ".ps1")
    
    try {
        Write-Host "Downloading script from $Url..." -ForegroundColor Green
        Invoke-WebRequest -Uri $Url -OutFile $tempFile
        Write-Host "Script downloaded to $tempFile" -ForegroundColor Green
        
        Write-Host "Executing script..." -ForegroundColor Green
        Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$tempFile`"" -Wait -NoNewWindow
    } catch {
        Write-Host "An error occurred while processing the script: $_" -ForegroundColor Red
    } finally {
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force
            Write-Host "Temporary file removed." -ForegroundColor Green
        }
    }
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
        1 { Download-And-Execute-Script "$baseUrl/fix1.ps1" }
        2 { Download-And-Execute-Script "$baseUrl/fix2.ps1" }
        3 { Download-And-Execute-Script "$baseUrl/fix3.ps1" }
        4 { Download-And-Execute-Script "$baseUrl/fix4.ps1" }
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

    # Pause for 2 seconds if the choice is not '0'
    #if ($choice -ne '0') { 
     #   Start-Sleep -Seconds 2 
    #}

    # Prompt the user to press Enter to continue
    Write-Host "`nPress Enter to continue..."
    Read-Host
} while ($choice -ne '0')
