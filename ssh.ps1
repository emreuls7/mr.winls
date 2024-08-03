# PowerShell script to connect to an SSH server and handle host key issues

# Prompt for IP address and credentials
$ip_address = Read-Host "Enter IP address"
$user = "root"  # Set username here
$password = "YourPasswordHere"  # Set password here

# Define the path to the known hosts file
$knownHostsFile = "$env:USERPROFILE\.ssh\known_hosts"

# Function to remove old host key from known hosts file
function Remove-HostKey {
    param (
        [string]$host
    )

    if (Test-Path $knownHostsFile) {
        $tempFile = [System.IO.Path]::GetTempFileName()
        $found = $false

        # Read the known hosts file and write all lines except the one matching the host
        Get-Content $knownHostsFile | ForEach-Object {
            if ($_ -match "$host") {
                $found = $true
            } else {
                Add-Content -Path $tempFile -Value $_
            }
        }

        # Replace the known hosts file with the updated file
        if ($found) {
            Move-Item -Path $tempFile -Destination $knownHostsFile -Force
            Write-Output "Old host key for $host removed."
        } else {
            Remove-Item -Path $tempFile -Force
            Write-Output "No host key found for $host."
        }
    } else {
        Write-Output "Known hosts file not found."
    }
}

# Remove old host key
Remove-HostKey $ip_address

# Use Plink to connect (ensure Plink is installed and in PATH)
$plinkPath = "plink.exe"  # Adjust if Plink is in a different location

# Check if Plink exists
if (Test-Path $plinkPath) {
    # Connect using Plink
    & $plinkPath -ssh "$user@$ip_address" -pw $password -batch -noagent
} else {
    Write-Output "Plink is not found in the system PATH. Please install PuTTY or ensure Plink is accessible."
}

# Optional: Pause to see the output (remove or adjust as needed)
Read-Host -Prompt "Press Enter to continue..."
