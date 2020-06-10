#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   

#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Details {
    If ($psSeven) { 
        $Cpu = (Get-CimInstance win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object Average ).Average
        $CpuCores = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors
        $avmem = (Get-CimInstance Win32_OperatingSystem | Foreach-Object { "{0:N2} GB" -f ($_.totalvisiblememorysize / 1MB) })
        $os = (Get-CimInstance win32_operatingsystem).caption
        $computername = (Get-CimInstance Win32_OperatingSystem).CSName

    }
    Else {
        $Cpu = (Get-WMIObject win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object Average ).Average
        $CpuCores = (Get-WMIObject Win32_ComputerSystem).NumberOfLogicalProcessors
        $avmem = (Get-WMIObject Win32_OperatingSystem | Foreach-Object { "{0:N2} GB" -f ($_.totalvisiblememorysize / 1MB) })
        $os = (Get-WMIObject win32_operatingsystem).caption
        $computername = (Get-WMIObject Win32_OperatingSystem).CSName
    }
    $host.UI.RawUI.ForegroundColor = "Cyan"
    #$host.UI.RawUI.BackgroundColor = "Black"

    $totalmem = "{0:N2} GB" -f ((Get-Process | Measure-Object Workingset -sum).Sum / 1GB)
    If ((Get-Process "$process" -ea SilentlyContinue)) {
        $mem = "{0:N2} GB" -f ((Get-Process $process | Measure-Object Workingset -sum).Sum / 1GB) 
    }

    Get-ChecktaskDetails
    Get-ChecktaskautorestartDetails
    Test-SteamMaster
    Get-CreatedVaribles
    $stats = $masterserver
    # $masterserver = $masterserver.addr
    New-BackupFolder
    $backups = (Get-Childitem  $backupdir -recurse | Measure-Object) 
    $backups = $backups.count 
    $backupssize = "{0:N2} GB" -f ((Get-Childitem $backupdir | Measure-Object Length -Sum -ea silentlycontinue ).Sum / 1GB) 
    #Get-WMIObject -Class Win32_Product -Filter "Name LIKE '%Visual C++ 2010%'"
    Write-Host "                                "
    Write-Host "    Server Name       : $hostname"
    Write-Host "    Public IP         : $extip"
    Write-Host "    IP                : $ip"
    Write-Host "    Port              : $port"
    Write-Host "    Query Port        : $queryport"
    Write-Host "    Rcon Port         : $rconport"
    Write-Host "    App ID            : $appid"
    Write-Host "    Game Dig          : $querytype"
    Write-Host "    Process           : $process"
    Write-Host "    Process status    : "-NoNewline; ; If ($Null -eq (Get-Process "$process" -ea SilentlyContinue)) { $status = " ----NOT RUNNING----"; ; Write-Host $status -F R }Else { $status = " **** RUNNING ****"; ; Write-Host $status -F Green }
    Write-Host "    CPU Cores         : $CpuCores"
    Write-Host "    CPU %             : $cpu"
    Write-Host "    Total RAM         : $avmem    "
    Write-Host "    Total RAM Usage   : $totalmem"
    Write-Host "    Process RAM Usage : $mem"
    Write-Host "    Backups           : $backups"
    Write-Host "    Backups size GB   : $backupssize"
    Write-Host "    Status            : "-NoNewline; ; If ($Null -eq $stats) { $stats = "----Offline----"; ; Write-Host $stats -F R }Else { $stats = "**** Online ***"; ; Write-Host $stats -F Green }
    Write-Host "    Steam Master      : $masterserver"
    Write-Host "    Monitor Job       : $monitorjob"
    Write-Host "    Autorestart       : $restartjob"
    Write-Host "    OS                : $os"
    Write-Host "    hostname          : $computername"
    Set-Location $currentdir
}
Function Get-DriveSpace {
    If ($psSeven) {
        $disks = Get-CimInstance -class "Win32_LogicalDisk" -namespace "root\CIMV2" -computername $env:COMPUTERNAME
    }
    Else {
        $disks = Get-WMIObject -class "Win32_LogicalDisk" -namespace "root\CIMV2" -computername $env:COMPUTERNAME
    }
    $results = Foreach ($disk in $disks) {
        If ($disk.Size -gt 0) {
            $size = [math]::round($disk.Size / 1GB, 0)
            $free = [math]::round($disk.FreeSpace / 1GB, 0)
            [PSCustomObject]@{
                Drive           = $disk.Name
                Name            = $disk.VolumeName
                "Total Disk GB" = $size
                "Free Disk GB"  = "{0:N0} ({1:P0})" -f $free, ($free / $size)
            }
        }
    }
    #$results | Out-GridView
    $results | Format-Table -AutoSize
    #$results | Export-Csv  .\disks.csv -NoTypeInformation -Encoding ASCII
}
