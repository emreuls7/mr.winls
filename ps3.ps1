# Clear the console
Clear-Host

Write-Host "`nPress Enter to continue..."
    Read-Host

Clear-Host


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
     # Script kaynakları için temel URL
    $baseUrl = "https://raw.githubusercontent.com/emreuls7/mr.winls/tool/"

    
# Start Office setup and handle any errors
try {
    Start-Process "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe" -ErrorAction Stop
    Write-Host "Office setup started successfully."
}
catch {
    Write-Host "Failed to start Office setup. The file may not be found. Continuing with the script..."
}

Read-Host -Prompt "Press Enter to continue after Office setup has started or if it failed"

# Pause to allow user to view the previous message
Start-Sleep -Seconds 2
Clear-Host

# Prompt user for Massgrave setup
try { 
    Download-And-Execute-Script "$baseUrl/massgrave_mas.ps1"
    Write-Host "Massgrave setup completed successfully."
}
catch {
    Write-Host "Failed to execute Massgrave setup script. Continuing with the script..."
}

# Notify user that script execution is complete and wait for Enter key
Write-Host "Script execution completed. Press Enter to exit."
Read-Host

# Execute additional script
try {
    Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pc.ps1").Content
    Write-Host "Additional script executed successfully."
}
catch {
    Write-Host "Failed to execute additional script."
}

exit
