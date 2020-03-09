#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-SourceMetaMod {
    Get-SourceMetaModWebrequest
    If ($metamodurl -and $metamodoutput -and $sourcemodoutput -and $sourcemoddirectory) {
        
        $start_time = Get-Date
        $global:package = 'MetaMod'
        $global:infomessage = "Downloading"
        Get-Infomessage
        #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $metamodurl -OutFile $metamodoutput
        If (!$?) { 
            $global:warnmessage = 'Downloadfailed'
            Get-WarnMessage
        }
        ElseIf ($?) {
            $global:infomessage = "Downloaded"
            Get-Infomessage
        } 
        $global:infomessage = "downloadtime"
        Get-Infomessage
        $global:infomessage = "Extracting"
        Get-Infomessage
        If ($metamodoutput -and $metamoddirectory){
        Expand-Archive $metamodoutput $metamoddirectory -Force >$null 2>&1
        }
        If (!$?) { 
            $global:warnmessage = 'ExtractFailed'
            Get-WarnMessage
            New-TryagainNew
        }
        Add-Content $ssmlog "[$loggingdate] Copying/installing Meta Mod"
        If ($metamoddirectory -and $systemdir){ 
        Copy-Item  $metamoddirectory -Destination $systemdir -Force -Recurse >$null 2>&1
        }
        If (!$?) { 
            Add-Content $ssmlog "[$loggingdate] Copying Meta Mod Failed"
            New-TryagainNew 
        }
        $start_time = Get-Date
        $global:package = 'SourceMod'
        $global:infomessage = "Downloading"
        Get-Infomessage
        #(New-Object Net.WebClient).DownloadFile("$sourcemodurl", "$currentdir\sourcemod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        If ($sourcemodurl -and $sourcemodoutput){
        Invoke-WebRequest -Uri $sourcemodurl -OutFile $sourcemodoutput
        }
        If (!$?) { 
            $global:warnmessage = 'Downloadfailed'
            Get-WarnMessage
            New-TryagainNew 
        }
        ElseIf ($?) {
            $global:infomessage = "Downloaded"
            Get-Infomessage
        }
        $global:infomessage = "downloadtime"
        Get-Infomessage 
        $global:infomessage = "Extracting"
        Get-Infomessage
        Expand-Archive $sourcemodoutput $sourcemoddirectory -Force >$null 2>&1
        If (!$?) {
            $global:warnmessage = 'ExtractFailed'
            Get-WarnMessage 
            New-TryagainNew 
        }
        ElseIf ($?) {
            $global:infomessage = "Extracted"
            Get-Infomessage
        }
        $global:infomessage = "copying-installing"
        Get-Infomessage
        If ($sourcemoddirectory -and $systemdir){ 
        Copy-Item  $sourcemoddirectory -Destination $systemdir -Force -Recurse >$null 2>&1
        }
        If (!$?) { 
            Add-Content $ssmlog "[$loggingdate] Copying SourceMod Faileds "
            New-TryagainNew 
        }
    }
}