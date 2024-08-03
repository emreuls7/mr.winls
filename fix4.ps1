# Define a function to show the menu
function Show-Menu_21_04 {
    cls
    Write-Host "-------------------------------------------------------------------"
    Write-Host "---            --- * Outlook Fixed * ---                        ---" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[1] Outlook 2007 - 12.0 ost-pst 100gb"
    Write-Host "[2] Outlook 2007 - 12.0 ost-pst max"
    Write-Host "[3] Outlook 2010 - 14.0 ost-pst 100gb"
    Write-Host "[4] Outlook 2010 - 14.0 ost-pst max"
    Write-Host "[5] Outlook 2013 - 15.0 ost-pst 100gb"
    Write-Host "[6] Outlook 2013 - 15.0 ost-pst max"
    Write-Host "[7] Outlook 2016-2019-2021-365 - 16.0 ost-pst 100gb"
    Write-Host "[8] Outlook 2016-2019-2021-365 - 16.0 ost-pst max"
    Write-Host "[9] Outlook 2007 - 12.0 MaximumAttachmentSize"
    Write-Host "[10] Outlook 2010 - 14.0 MaximumAttachmentSize"
    Write-Host "[11] Outlook 2013 - 15.0 MaximumAttachmentSize"
    Write-Host "[12] Outlook 2016-2019-2021-365 - 16.0 MaximumAttachmentSize"
    Write-Host "-------------------------------------------------------------------"
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host "-------------------------------------------------------------------"
}

# Main loop to handle menu choices
do {
    Show-Menu_21_04
    $choice = Read-Host "Enter your choice (0,1,2,3,...):"

    switch ($choice) {
        '1' {
            Write-Host "Setting Outlook 2007 - 12.0 ost-pst 100gb..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\12.0\Outlook\PST' -Name 'WarmLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\12.0\Outlook\PST' -Name 'MaxLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\12.0\Outlook\OST' -Name 'WarmLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\12.0\Outlook\OST' -Name 'MaxLargeFileSize' -Value 6144 -Type DWord
            Write-Host "Configuration for Outlook 2007 - 12.0 set to 100gb."
            Pause
        }
        '2' {
            Write-Host "Setting Outlook 2007 - 12.0 ost-pst max..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\12.0\Outlook\PST' -Name 'WarmLargeFileSize' -Value 4080214766 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\12.0\Outlook\PST' -Name 'MaxLargeFileSize' -Value 4294967295 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\12.0\Outlook\OST' -Name 'WarmLargeFileSize' -Value 4080214766 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\12.0\Outlook\OST' -Name 'MaxLargeFileSize' -Value 4294967295 -Type DWord
            Write-Host "Configuration for Outlook 2007 - 12.0 set to max."
            Pause
        }
        '3' {
            Write-Host "Setting Outlook 2010 - 14.0 ost-pst 100gb..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\14.0\Outlook\PST' -Name 'WarmLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\14.0\Outlook\PST' -Name 'MaxLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\14.0\Outlook\OST' -Name 'WarmLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\14.0\Outlook\OST' -Name 'MaxLargeFileSize' -Value 6144 -Type DWord
            Write-Host "Configuration for Outlook 2010 - 14.0 set to 100gb."
            Pause
        }
        '4' {
            Write-Host "Setting Outlook 2010 - 14.0 ost-pst max..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\14.0\Outlook\PST' -Name 'WarmLargeFileSize' -Value 4080214766 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\14.0\Outlook\PST' -Name 'MaxLargeFileSize' -Value 4294967295 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\14.0\Outlook\OST' -Name 'WarmLargeFileSize' -Value 4080214766 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\14.0\Outlook\OST' -Name 'MaxLargeFileSize' -Value 4294967295 -Type DWord
            Write-Host "Configuration for Outlook 2010 - 14.0 set to max."
            Pause
        }
        '5' {
            Write-Host "Setting Outlook 2013 - 15.0 ost-pst 100gb..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\15.0\Outlook\PST' -Name 'WarmLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\15.0\Outlook\PST' -Name 'MaxLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\15.0\Outlook\OST' -Name 'WarmLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\15.0\Outlook\OST' -Name 'MaxLargeFileSize' -Value 6144 -Type DWord
            Write-Host "Configuration for Outlook 2013 - 15.0 set to 100gb."
            Pause
        }
        '6' {
            Write-Host "Setting Outlook 2013 - 15.0 ost-pst max..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\15.0\Outlook\PST' -Name 'WarmLargeFileSize' -Value 4080214766 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\15.0\Outlook\PST' -Name 'MaxLargeFileSize' -Value 4294967295 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\15.0\Outlook\OST' -Name 'WarmLargeFileSize' -Value 4080214766 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\15.0\Outlook\OST' -Name 'MaxLargeFileSize' -Value 4294967295 -Type DWord
            Write-Host "Configuration for Outlook 2013 - 15.0 set to max."
            Pause
        }
        '7' {
            Write-Host "Setting Outlook 2016-2019-2021-365 - 16.0 ost-pst 100gb..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Outlook\PST' -Name 'WarmLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Outlook\PST' -Name 'MaxLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Outlook\OST' -Name 'WarmLargeFileSize' -Value 6144 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Outlook\OST' -Name 'MaxLargeFileSize' -Value 6144 -Type DWord
            Write-Host "Configuration for Outlook 2016-2019-2021-365 - 16.0 set to 100gb."
            Pause
        }
        '8' {
            Write-Host "Setting Outlook 2016-2019-2021-365 - 16.0 ost-pst max..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Outlook\PST' -Name 'WarmLargeFileSize' -Value 4080214766 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Outlook\PST' -Name 'MaxLargeFileSize' -Value 4294967295 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Outlook\OST' -Name 'WarmLargeFileSize' -Value 4080214766 -Type DWord
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Outlook\OST' -Name 'MaxLargeFileSize' -Value 4294967295 -Type DWord
            Write-Host "Configuration for Outlook 2016-2019-2021-365 - 16.0 set to max."
            Pause
        }
        '9' {
            Write-Host "Setting Outlook 2007 - 12.0 MaximumAttachmentSize..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\12.0\Outlook\Preferences' -Name 'MaximumAttachmentSize' -Value 198656 -Type DWord
            Write-Host "MaximumAttachmentSize set for Outlook 2007 - 12.0."
            Pause
        }
        '10' {
            Write-Host "Setting Outlook 2010 - 14.0 MaximumAttachmentSize..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\14.0\Outlook\Preferences' -Name 'MaximumAttachmentSize' -Value 198656 -Type DWord
            Write-Host "MaximumAttachmentSize set for Outlook 2010 - 14.0."
            Pause
        }
        '11' {
            Write-Host "Setting Outlook 2013 - 15.0 MaximumAttachmentSize..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\15.0\Outlook\Preferences' -Name 'MaximumAttachmentSize' -Value 198656 -Type DWord
            Write-Host "MaximumAttachmentSize set for Outlook 2013 - 15.0."
            Pause
        }
        '12' {
            Write-Host "Setting Outlook 2016-2019-2021-365 - 16.0 MaximumAttachmentSize..."
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Office\16.0\Outlook\Preferences' -Name 'MaximumAttachmentSize' -Value 198656 -Type DWord
            Write-Host "MaximumAttachmentSize set for Outlook 2016-2019-2021-365 - 16.0."
            Pause
        }
        '0' {
            Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/microsoft_fixmenu.ps1").Content
            }
            exit
        }
        default {
            Write-Host "Invalid choice. Please enter a valid option."
            Pause
        }
    }
} while ($true)

