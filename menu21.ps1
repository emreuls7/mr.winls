# Define temporary directory
$tempDir = "$env:Temp"

function DownloadAndExecute {
    param (
        [string]$url,
        [string]$fileName
    )
    
    $filePath = Join-Path -Path $tempDir -ChildPath $fileName
    
    # Download the script
    Invoke-WebRequest -Uri $url -OutFile $filePath
    
    # Execute the script if it was downloaded successfully
    if (Test-Path $filePath) {
        & $filePath
        Remove-Item -Path $filePath
    }
}

function ShowMenu {
    Clear-Host
    Write-Output "-------------------------------------------------------------------"
    Write-Output "--- menu_21    --- * Windows Fixed * ---                        ---"
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[1] menu_21_1 System file Fixed"
    Write-Output "[2] menu_21_2"
    Write-Output "[3] menu_21_3"
    Write-Output "[4] menu_21_4 OUTLOOK FIX"
    Write-Output "-------------------------------------------------------------------"
    Write-Output "[0] Exit"
    Write-Output "-------------------------------------------------------------------"
}

# Display the menu first
ShowMenu

# Get user choice
$choice = Read-Host "Enter your choice (0,1,2,3...)"

# Handle user choices
switch ($choice) {
    '1' {
        Write-Output "Downloading and executing menu21_1.cmd..."
        DownloadAndExecute -url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_1.cmd" -fileName "menu21_1.cmd"
    }
    '2' {
        Write-Output "Downloading and executing menu21_2.cmd..."
        DownloadAndExecute -url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_2.cmd" -fileName "menu21_2.cmd"
    }
    '3' {
        Write-Output "Downloading and executing menu21_3.cmd..."
        DownloadAndExecute -url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_3.cmd" -fileName "menu21_3.cmd"
    }
    '4' {
        Write-Output "Downloading and executing menu21_4.cmd..."
        DownloadAndExecute -url "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu21_4.cmd" -fileName "menu21_4.cmd"
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

