param (
    [switch]$Help
)

# help
if ($Help) {
    Write-Host "--------------------------------------------------" -ForegroundColor Green
    Write-Host "AIDE - MONITOR.PS1" -ForegroundColor Green
    Write-Host "--------------------------------------------------"
    Write-Host "Description :"
    Write-Host "  Ce script affiche l'état actuel des ressources système."
    Write-Host ""
    Write-Host "Utilisation :"
    Write-Host "  .\monitor.ps1          Lancer le monitoring"
    Write-Host "  .\monitor.ps1 -Help    Afficher cette aide"
    Write-Host "--------------------------------------------------"
    exit
}

Write-Host "--- MONITORING SYSTEME ---" -ForegroundColor Cyan

# CPU
$cpu = Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object -ExpandProperty Average
Write-Host "CPU Usage      : $cpu %"

# 2. RAM 
$os = Get-CimInstance Win32_OperatingSystem
$totalRam = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$freeRam  = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$usedRam  = [math]::Round($totalRam - $freeRam, 2)
$percRam  = [math]::Round(($usedRam / $totalRam) * 100, 1)

Write-Host "RAM Usage      : Utilise $usedRam Go / Libre $freeRam Go (Total : $totalRam Go - $percRam%)"

# 3 DISQUE 
$disk = Get-PSDrive C
$usedDisk = [math]::Round($disk.Used / 1GB, 2)
$freeDisk = [math]::Round($disk.Free / 1GB, 2)
$percDisk = [math]::Round(($disk.Used / ($disk.Used + $disk.Free)) * 100, 1)

Write-Host "Disk Space (C) : Utilise $usedDisk Go / Libre $freeDisk Go (Occupation : $percDisk%)"