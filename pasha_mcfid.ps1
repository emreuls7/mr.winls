# Define the menu function
function Show-Menu {
    cls
    Write-Host "------------------------------------------------"
    Write-Host "--- Welcome Protel MC + Fidelio Install      ---"
    Write-Host "------------------------------------------------"
    Write-Host "[1] Windows Credentials 192.168.18.8 add"
    Write-Host "[2] Oracle Setup + Admin Copy"
    Write-Host "[3] MC Setup (Materials Control)"
    Write-Host "[4] Fidelio Setup"
    Write-Host "[5] Fidelio V8 Client Short Cut Setup"
    Write-Host "[6] IFC Setup"
    Write-Host "------------------------------------------------"
    Write-Host "[0] Exit"
    Write-Host "------------------------------------------------"
}

function Add-WindowsCredentials {
    cls
    Write-Host "------------------------------------------------"
    Write-Host "Adding Windows Credentials..."
    Write-Host "------------------------------------------------"
    cmdkey /add:192.168.18.8 /user:it /pass:C3kss181
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to add credentials." -ForegroundColor Red
        Pause
    }
}

function Oracle-Setup {
    cls
    Write-Host "------------------------------------------------"
    Write-Host "Starting Oracle Setup..."
    Write-Host "------------------------------------------------"
    Start-Process -FilePath "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\1-Oracle - setup\client 11204\setup.exe" -Wait
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Oracle setup failed." -ForegroundColor Red
        Pause
        return
    }
    
    Write-Host "------------------------------------------------"
    Write-Host "Copying Oracle files..."
    Write-Host "------------------------------------------------"
    robocopy "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\2-Oracle Admin - copypast\Oracle" "C:\Oracle" /E /IS
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to copy Oracle files." -ForegroundColor Red
        Pause
    }
}

function MC-Setup {
    cls
    Write-Host "------------------------------------------------"
    Write-Host "Starting .NET Framework Setup..."
    Write-Host "------------------------------------------------"
    Start-Process -FilePath "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\3-MC - setup\dotNetFx35setup.exe" -Wait
    if ($LASTEXITCODE -ne 0) {
        Write-Host ".NET setup failed." -ForegroundColor Red
        Pause
        return
    }

    cls
    Write-Host "------------------------------------------------"
    Write-Host "MC Setup Information"
    Write-Host "---------------------"
    Write-Host "pass: Mymicros1!"
    Write-Host "svr: MC"
    Write-Host "---------------------"
    Write-Host "Starting MC Setup..."
    Write-Host "------------------------------------------------"
    Start-Process -FilePath "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\3-MC - setup\1-18.1.8.0\setup.exe" -Wait
    if ($LASTEXITCODE -ne 0) {
        Write-Host "MC setup failed." -ForegroundColor Red
        Pause
        return
    }

    Write-Host "------------------------------------------------"
    Write-Host "Copying MC files..."
    Write-Host "------------------------------------------------"
    robocopy "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\3-MC - setup\2-Sqlcopy" "C:\Program Files (x86)\Materials Control" /E /IS
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to copy MC files." -ForegroundColor Red
        Pause
        return
    }

    Write-Host "------------------------------------------------"
    Write-Host "Updating Permissions..."
    Write-Host "------------------------------------------------"
    icacls "C:\Program Files (x86)\Materials Control" /grant "Authenticated Users:(OI)(CI)(M)"
    icacls "C:\ProgramData\Microsoft\Crypto\RSA\MachineKeys" /grant "Authenticated Users:(OI)(CI)(M)"
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to update permissions." -ForegroundColor Red
        Pause
    }
}

function Fidelio-Setup {
    cls
    Write-Host "------------------------------------------------"
    Write-Host "Fidelio Setup Information"
    Write-Host "------------------------------------------------"
    Write-Host "nls_lang: TURKISH_TURKEY.TR8MSWIN1254"
    Write-Host "V8LIVE"
    Write-Host "LIVE"
    Write-Host "V8"
    Write-Host "V8TRAIN"
    Write-Host "TRAIN"
    Write-Host "V8"
    Write-Host "------------------------------------------------"
    Start-Process -FilePath "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\4-Fidelio - setup\8.13.0.0 Full\setup.exe" -Wait
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Fidelio setup failed." -Foreground
    Write-Host "------------------------------------------------"
    Write-Host "Copying Fidelio files..."
    Write-Host "------------------------------------------------"
    robocopy "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\5-Fidelio - copypast\8.13.2.0" "C:\FIDELIO" /E /IS
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to copy Fidelio files." -ForegroundColor Red
        Pause
    }
}

function Fidelio-Shortcut {
    cls
    Write-Host "------------------------------------------------"
    Write-Host "Installing Fidelio V8 Client Shortcut..."
    Write-Host "------------------------------------------------"
    Start-Process -FilePath "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\6-V8-Client-Short-Cut -setup\V8-Client-Short-Cut.exe" -Wait
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Fidelio V8 Client Shortcut setup failed." -ForegroundColor Red
        Pause
    }
}

function IFC-Setup {
    cls
    Write-Host "------------------------------------------------"
    Write-Host "Starting IFC Setup..."
    Write-Host "------------------------------------------------"
    Start-Process -FilePath "\\192.168.18.8\micros-fidelio\Setup\Oracle_MC_Fidelio-Setup\7-IFC - setup\IFC8.13.exe" -Wait
    if ($LASTEXITCODE -ne 0) {
        Write-Host "IFC setup failed." -ForegroundColor Red
        Pause
    }
}

# Main script loop
while ($true) {
    Show-Menu
    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    
    switch ($choice) {
        "1" { Add-WindowsCredentials }
        "2" { Oracle-Setup }
        "3" { MC-Setup }
        "4" { Fidelio-Setup }
        "5" { Fidelio-Shortcut }
        "6" { IFC-Setup }
        "0" {
            cls
            Write-Host "------------------------------------------------"
            Write-Host "Installation Complete. See you next time!"
            Write-Host "------------------------------------------------"
            Start-Sleep -Seconds 3
            break
        }
        default {
            Write-Host "Invalid choice. Please enter a number between 0 and 6." -ForegroundColor Yellow
            Start-Sleep -Seconds 2
        }
    }
}
