# Clear the console
Clear-Host

Write-Host "`nPress Enter to continue..."
Read-Host

Clear-Host

# Confirm starting Office setup
$confirmOffice = Read-Host "Do you want to start the Office setup? (Yes(Y) / No(N))"
if ($confirmOffice -eq 'Y' -or $confirmOffice -eq 'y') {
    # Start Office setup and handle any errors
    try {
        Write-Host "Starting Office setup..."
        Start-Process "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe" -ErrorAction Stop
        Write-Host "Office setup started successfully."
    }
    catch {
        Write-Host "Failed to start Office setup. The file may not be found or there was an issue with the path. Continuing with the script..."
    }
} else {
    Write-Host "Office setup will not be started. Continuing with the script..."
}

Read-Host -Prompt "Press Enter to continue after Office setup has started or if it was skipped"

# Pause to allow user to view the previous message
Start-Sleep -Seconds 2
Clear-Host

# Define base URL for script download
$baseUrl = "http://example.com/scripts" # Change this to your actual base URL

# Define function to download and execute a script
function Download-And-Execute-Script {
    param (
        [string]$scriptUrl
    )
    try {
        Write-Host "Downloading script from $scriptUrl..."
        $scriptContent = Invoke-WebRequest -Uri $scriptUrl -UseBasicP
        Write-Host "Executing downloaded script..."
        Invoke-Expression $scriptContent.Content
    }
    catch {
        Write-Host "Failed to download or execute the script from $scriptUrl."
    }
}

# Prompt user for Massgrave setup
try {
    Download-And-Execute-Script "$baseUrl/massgrave_mas.ps1"
    Write-Host "Massgrave setup completed successfully."
}
catch {
    Write-Host "Failed to execute Massgrave setup script. Continuing with the script..."
}

# Execute additional script
try {
    Write-Host "Executing additional script from GitHub..."
    $additionalScriptUrl = "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pc.ps1"
    $scriptContent = Invoke-WebRequest -Uri $additionalScriptUrl
    Invoke-Expression $scriptContent.Content
    Write-Host "Additional script executed successfully."
}
catch {
    Write-Host "Failed to execute additional script from GitHub."
}

# Notify user that script execution is complete and wait for Enter key
Write-Host "Script execution completed. Press Enter to exit."
Read-Host

exit
