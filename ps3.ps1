# Prompt user for Office setup
    Start-Process "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe"
    Read-Host -Prompt "Press any key to continue"
# Pause to allow user to view the previous message
Start-Sleep -Seconds 2
Clear-Host


# Prompt user for Massgrave setup
    Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1").Content


Write-Host "Script execution completed. Press Enter to exit."
Read-Host

# Execute additional script
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pc.ps1").Content
