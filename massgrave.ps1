Write-Host "You chose Microsoft Activation Scripts (MAS)."                                                                    -ForegroundColor Cyan
            #Start-Process "irm https://massgrave.dev/get | iex" -Verb RunAs
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-RestMethod -Uri "https://massgrave.dev/get" | Invoke-Expression
