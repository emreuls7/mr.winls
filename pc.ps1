
function Show-Menu {
    Clear-Host
    Write-Host "----------------------------------------" -ForegroundColor Green
    Write-Host "---      DEFAULT PC INSTALL          ---" -ForegroundColor Red
    Write-Host "----------------------------------------" -ForegroundColor Green
    Write-Host "[1] USER DEFAULT SET        " -ForegroundColor Magenta
    Write-Host "[2] INSTALL DEFAULT            " -ForegroundColor Yellow
    Write-Host "[3] OFFICE INSTALL        " -ForegroundColor Cyan
    Write-Host "----------------------------------------" -ForegroundColor Green
    Write-Host "[0] Exit                    " -ForegroundColor Red
    Write-Host "----------------------------------------" -ForegroundColor Green
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

function Handle-Choice {
    param (
        [int]$Choice
    )

    
    Clear-Host
    switch ($Choice) {
        1 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pc1.ps1" }
        2 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pc2.ps1" }
        3 { Download-And-Execute-Script "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pc3.ps1" }
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
