# Clear the console
Clear-Host

function Show-Menu {
    Clear-Host
    Write-Host "------------------------------------------------" -ForegroundColor Cyan
    Write-Host "---    Pasha Lefkosa Tiger3 Install          ---" -ForegroundColor Cyan
    Write-Host "------------------------------------------------" -ForegroundColor Cyan
    Write-Host "[1] Windows Credentials 192.168.13.3 add" -ForegroundColor Yellow
    Write-Host "[2] Tiger3 PASHA Copy C" -ForegroundColor Yellow
    Write-Host "[3] Tiger3 2015-2019 Copy C" -ForegroundColor Yellow
    Write-Host "[4] Tiger3 2019 Copy C" -ForegroundColor Yellow
    Write-Host "[5] Tiger3 2022 Copy C" -ForegroundColor Yellow
    Write-Host "------------------------------------------------" -ForegroundColor Cyan
    Write-Host "[6] Windows Credentials 192.168.48.4 add" -ForegroundColor Yellow
    Write-Host "[7] Tiger3 AKUN Copy C" -ForegroundColor Yellow
    Write-Host "------------------------------------------------" -ForegroundColor Cyan
    Write-Host "[11] License Tiger3 PASHA" -ForegroundColor Yellow
    Write-Host "[12] License Tiger3 2015-2019" -ForegroundColor Yellow
    Write-Host "[13] License Tiger3 2019" -ForegroundColor Yellow
    Write-Host "[14] License Tiger3 2022" -ForegroundColor Yellow
    Write-Host "------------------------------------------------" -ForegroundColor Cyan
    Write-Host "[15] License Tiger3 AKUN" -ForegroundColor Yellow
    Write-Host "------------------------------------------------" -ForegroundColor Cyan
    Write-Host "[21] LHOSVR Windows host" -ForegroundColor Yellow
    Write-Host "------------------------------------------------" -ForegroundColor Cyan
    Write-Host "[0] Exit" -ForegroundColor Yellow
    Write-Host "------------------------------------------------" -ForegroundColor Cyan

    $choice = Read-Host "Enter your choice (0,1,2,3...)"
    return $choice
}

function CmdKey-Add-192_168_13_3 {
    cmdkey /add:192.168.13.3 /user:grandpasha /pass:grand2013
    Write-Host "Windows Credentials for 192.168.13.3 added."
}

function CmdKey-Add-192_168_48_4 {
    cmdkey /add:192.168.48.4 /user:grandpasha /pass:grand2013
    Write-Host "Windows Credentials for 192.168.48.4 added."
}

function Copy-Tiger3-Pasha {
    robocopy "\\192.168.13.3\tiger3_share\TIGER3_PASHA" "C:\TIGER3\TIGER3_PASHA" /E /IS
    Write-Host "Tiger3 PASHA files copied to C:\TIGER3\TIGER3_PASHA."
}

function Copy-Tiger3-2015_2019 {
    robocopy "\\192.168.13.3\tiger3_share\TIGER3_2015-2019" "C:\TIGER3\TIGER3_2015-2019" /E /IS
    Write-Host "Tiger3 2015-2019 files copied to C:\TIGER3\TIGER3_2015-2019."
}

function Copy-Tiger3-2019 {
    robocopy "\\192.168.13.3\tiger3_share\TIGER3_2019" "C:\TIGER3\TIGER3_2019" /E /IS
    Write-Host "Tiger3 2019 files copied to C:\TIGER3\TIGER3_2019."
}

function Copy-Tiger3-2022 {
    robocopy "\\192.168.13.3\tiger3_share\TIGER3_2022" "C:\TIGER3\TIGER3_2022" /E /IS
    Write-Host "Tiger3 2022 files copied to C:\TIGER3\TIGER3_2022."
}

function Copy-Tiger3-Akun {
    robocopy "\\192.168.48.4\tiger3_share\TIGER3_AKUN" "C:\TIGER3\TIGER3_AKUN" /E /IS
    Write-Host "Tiger3 AKUN files copied to C:\TIGER3\TIGER3_AKUN."
}

function License-Tiger3-Pasha {
    robocopy "\\192.168.13.3\tiger3_share\TIGER3_PASHA" "C:\TIGER3\TIGER3_PASHA" License.Dat /IS
    Write-Host "*AFFERIM LISANSI YAPTIN TEBRIK EDRIM ..."
}

function License-Tiger3-2015_2019 {
    robocopy "\\192.168.13.3\tiger3_share\TIGER3_2015-2019" "C:\TIGER3\TIGER3_2015-2019" License.Dat /IS
    Write-Host "*AFFERIM LISANSI YAPTIN TEBRIK EDRIM ..."
}

function License-Tiger3-2019 {
    robocopy "\\192.168.13.3\tiger3_share\TIGER3_2019" "C:\TIGER3\TIGER3_2019" License.Dat /IS
    Write-Host "*AFFERIM LISANSI YAPTIN TEBRIK EDRIM ..."
}

function License-Tiger3-2022 {
    robocopy "\\192.168.13.3\tiger3_share\TIGER3_2022" "C:\TIGER3\TIGER3_2022" License.Dat /IS
    Write-Host "*AFFERIM LISANSI YAPTIN TEBRIK EDRIM ..."
}

function License-Tiger3-Akun {
    robocopy "\\192.168.48.4\tiger3_share\TIGER3_AKUN" "C:\TIGER3\TIGER3_AKUN" License.Dat /IS
    Write-Host "*AFFERIM LISANSI YAPTIN TEBRIK EDRIM ..."
}

function Run-Lhosvr {
    Start-Process "\\192.168.13.3\tiger3_share\License\TIGER3_HOST" -Wait
}

do {
    $choice = Show-Menu
    
    switch ($choice) {
        "1" { CmdKey-Add-192_168_13_3 }
        "2" { Copy-Tiger3-Pasha }
        "3" { Copy-Tiger3-2015_2019 }
        "4" { Copy-Tiger3-2019 }
        "5" { Copy-Tiger3-2022 }
        "6" { CmdKey-Add-192_168_48_4 }
        "7" { Copy-Tiger3-Akun }
        "11" { License-Tiger3-Pasha }
        "12" { License-Tiger3-2015_2019 }
        "13" { License-Tiger3-2019 }
        "14" { License-Tiger3-2022 }
        "15" { License-Tiger3-Akun }
        "21" { Run-Lhosvr }
        "0" { Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/pasha/pasha_menu.ps1").Content
        #Write-Host "BYE"; Start-Sleep -Seconds 3; exit 
        }
        default { Write-Host "Invalid choice. Please select a valid option."; Start-Sleep -Seconds 2 }
    }
} while ($choice -ne "0")
