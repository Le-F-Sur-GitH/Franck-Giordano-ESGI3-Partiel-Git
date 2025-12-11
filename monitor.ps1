Write-Host "--- MONITORING SYSTEME ---"
Write-Host "CPU Usage:"
Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object Average

Write-Host "RAM Usage:"
Get-CimInstance Win32_OperatingSystem | Select-Object FreePhysicalMemory
Write-Host "Disk Space:"
Get-PSDrive C | Select-Object Used, Free