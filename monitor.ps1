Write-Host "--- MONITORING SYSTEME ---"
Write-Host "CPU Usage:"
Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object Average

Write-Host "RAM Usage:"
Get-MaRam -ErrorAction Stop

Write-Host "Disk Space:"
Get-PSDrive C | Select-Object Used, Free