# showmenu
function ShowMenu {
    Clear-Host
    Write-Output "-------------------------------------------------------------------"
    Write-Output "--- menu_21    --- DEFAULT PC INSTALLER ---                     ---" -ForegroundColor Red
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[1] USER DEFAULT SET"
    Write-Output "[2] INSTALL DEFAULT"
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[0] Exit" -ForegroundColor Red
    Write-Output "-------------------------------------------------------------------"
}

# Display the menu first
ShowMenu

# Get user choice
$choice = Read-Host "Enter your choice (0,1,2,3...)"


# Handle user choices
switch ($choice) {
    '1' {
        Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90_1.ps1").Content
    }
    '2' {
        Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90_2.ps1").Content
    }
    '0' {
        Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1").Content
    }
    default {
        Write-Output "Invalid choice. Please enter a valid option."
    }
}

# Pause and return to menu
Read-Host "Press Enter to continue..."
ShowMenu
