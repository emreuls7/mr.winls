# Prompt user for Office setup
$setupOffice = Read-Host "Do you want to set up OFFICE? (Yes(Y) / No(N))"
if ($setupOffice -eq 'Y') {
    Start-Process "\\192.168.18.2\setup\source\office\office2021ProPlus_tr\Setup64.exe"
}

# Pause to allow user to view the previous message
Start-Sleep -Seconds 2
Clear-Host

Write-Host "------------------------"

# Prompt user for Massgrave setup
$masOpen = Read-Host "mas open or? (Yes(Y) / No(N))"
if ($masOpen -eq 'Y') {
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1' -OutFile "$env:TEMP\massgrave_mas.ps1"
    & "$env:TEMP\massgrave_mas.ps1"
}

Write-Host "--------------------------------------"
Write-Host "--- BUNUDA BITIRDIN HADI IYISIN... ---"
Write-Host "--------------------------------------"

# Pause to allow user to view the previous message
Read-Host -Prompt "Press Enter to continue"

Clear-Host

Write-Host "--------------------------------"
Write-Host "---SEN GEDE RESTART AT AGA...---"
Write-Host "--------------------------------"

# Prompt user for restart
# Uncomment if restart is desired
# $restart = Read-Host "Do you want to RESTART the computer? (Yes(Y) / No(N))"
# if ($restart -eq 'Y') {
#    Restart-Computer -Force
# } else {
#    Write-Host "Exiting..."
#    exit
# }

# Execute additional script
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/pc.ps1").Content
