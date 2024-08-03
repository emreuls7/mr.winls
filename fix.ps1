# Function to clear the screen and display the menu
function Show-Menu {
    Clear-Host
    Clear-Host
    Write-Output "-------------------------------------------------------------------"
    Write-Output "---            --- * Windows Fixed * ---                        ---"
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[1] menu_21_1 System file Fixed"
    Write-Output "[2] menu_21_2"
    Write-Output "[3] menu_21_3"
    Write-Output "[4] menu_21_4 OUTLOOK FIX"
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[0] Exit"
    Write-Output "-------------------------------------------------------------------"
}

# Function to handle installations and activations
function Handle-Choice {
    param (
        [int]$choice
    )

# Handle user choices
switch ($choice) {
    1 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/fix1.ps1").Content }
    2 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/fix2.ps1").Content }
    3 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/fix3.ps1").Content }
    4 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/win/fix4.ps1").Content }
    0 { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1").Content }
    default {
        Write-Output "Invalid choice. Please enter a valid option."
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
