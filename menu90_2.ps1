# Clear the console
Clear-Host

Write-Host "------------------------"
Write-Host "Installing .NET Frameworks..."
choco install dotnet3.5 -y
choco install dotnet4.5.1 -y
choco install dotnet4.5.2 -y
Write-Host "------------------------"

Write-Host "Installing VC Redistributables..."
$vcRedists = @(
    "Microsoft.VCRedist.2005.x86",
    "Microsoft.VCRedist.2005.x64",
    "Microsoft.VCRedist.2008.x86",
    "Microsoft.VCRedist.2008.x64",
    "Microsoft.VCRedist.2010.x86",
    "Microsoft.VCRedist.2010.x64",
    "Microsoft.VCRedist.2012.x86",
    "Microsoft.VCRedist.2012.x64",
    "Microsoft.VCRedist.2013.x86",
    "Microsoft.VCRedist.2013.x64",
    "Microsoft.VCRedist.2015+.x86",
    "Microsoft.VCRedist.2015+.x64"
)
foreach ($redistributable in $vcRedists) {
    winget install $redistributable -e
}
Write-Host "------------------------"

Write-Host "Installing additional software..."
$software = @(
    "Google.Chrome",
    "Notepad++.Notepad++",
    "RARLab.WinRAR",
    "VideoLAN.VLC",
    "Adobe.Acrobat.Reader.64-bit",
    "AcroSoftwareInc.CutePDFWriter",
    "AdrienAllard.FileConverter",
    "uvncbvba.UltraVnc"
)
foreach ($app in $software) {
    winget install $app -e
}
Write-Host "------------------------"

Write-Host "Upgrading installed software..."
winget upgrade --all
choco upgrade chocolatey
choco upgrade all -y
Write-Host "------------------------"

# Define the path to the Google Chrome executable
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Check if Chrome exists at the specified path
if (Test-Path $chromePath) {
    Write-Output "Google Chrome found at $chromePath"

    # Define registry paths and values for HTTP and HTTPS protocols
    $regPathHttp = "HKCR:\http\shell\open\command"
    $regPathHttps = "HKCR:\https\shell\open\command"
    $chromeCommand = "`"$chromePath`" -- `%1`"  # Note the escaping for registry

    # Set the default command for HTTP and HTTPS to Google Chrome
    Set-ItemProperty -Path $regPathHttp -Name "(default)" -Value $chromeCommand
    Set-ItemProperty -Path $regPathHttps -Name "(default)" -Value $chromeCommand

    # Notify user
    Write-Output "Google Chrome has been set as the default browser for HTTP and HTTPS protocols."
} else {
    Write-Output "Google Chrome not found at $chromePath. Please make sure it is installed."
}

# Define the path to the Adobe Reader executable
$adobePath = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

# Check if Adobe Reader exists at the specified path
if (Test-Path $adobePath) {
    Write-Output "Adobe Reader found at $adobePath"

    # Define registry paths and values for PDF files
    $pdfRegistryPath = "HKCR:\.pdf\shell\open\command"
    $adobeCommand = "`"$adobePath`" `"%1`"  # Note the escaping for registry

    # Set the default command for PDF files to Adobe Reader
    Set-ItemProperty -Path $pdfRegistryPath -Name "(default)" -Value $adobeCommand

    # Notify user
    Write-Output "Adobe Reader has been set as the default PDF viewer."
} else {
    Write-Output "Adobe Reader not found at $adobePath. Please make sure it is installed."
}



# Prompt user for Office setup
$setupOffice = Read-Host "Do you want to set up an OFFICE? (Yes(Y) / No(N))"
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
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emreuls7/mr.winls/tool/massgrave_mas.ps1' -UseBasicP -OutFile "$env:TEMP\massgrave_mas.ps1"
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
# $restart = Read-Host "Do you want to RESTART the computer? (Yes(Y) / No(N))"
# if ($restart -eq 'Y') {
#    Restart-Computer -Force
#} else {
#    Write-Host "Exiting..."
    #exit
#}

Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/emreuls7/mr.winls/menu/menu90.ps1").Content
