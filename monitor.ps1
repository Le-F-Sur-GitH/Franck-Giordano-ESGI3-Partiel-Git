Write-Host "--- MONITORING SYSTEME ---"
Write-Host "CPU Usage:"
Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object Average
