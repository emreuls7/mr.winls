# Function to display the menu
function Show-Menu {
    Clear-Host
    Write-Output "-------------------------------------------------------------------"
    Write-Output "--- menu_21    --- DEFAULT PC INSTALLER ---                     ---"-ForegroundColor Red
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[1] USER DEFAULT SET"
    Write-Output "[2] INSTALL DEFAULT"
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[0] Exit" -ForegroundColor Red
    Write-Output "-------------------------------------------------------------------"
}

# Function to handle user choice
function Handle-Choice {
    param (
        [string]$choice
    )
    
    switch ($choice) {
        '1' {
            try {
                $content = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90_1.ps1" -ErrorAction Stop
                Invoke-Expression $content.Content
            } catch {
                Write-Output "Error fetching or executing script for USER DEFAULT SET."
            }
        }
        '2' {
            try {
                $content = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90_2.ps1" -ErrorAction Stop
                Invoke-Expression $content.Content
            } catch {
                Write-Output "Error fetching or executing script for INSTALL DEFAULT."
            }
        }
        '0' {
            try {
                $content = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/main/program.ps1" -ErrorAction Stop
                Invoke-Expression $content.Content
            } catch {
                Write-Output "Error fetching or executing script for Exit."
            }
        }
        default {
            Write-Output "Invalid choice. Please enter a valid option."
        }
    }
}

# Main loop to display the menu and handle user choices
do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    Handle-Choice -choice $choice
    if ($choice -ne '0') {
        Read-Host "Press Enter to continue..."
    }
} while ($choice -ne '0')
