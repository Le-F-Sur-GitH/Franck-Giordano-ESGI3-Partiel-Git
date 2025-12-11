Write-Host "Disk Space:"
Get-PSDrive C | Select-Object Used, Free
