#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-SteamInfo {
    $title = 'Install Steam server with Anonymous login'
    $question = 'Use Anonymous Login?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    If ($decision -eq 1) {
        $global:anon = "yes"
        #Install-Anonserver
        Install-ServerFiles
        Write-Host 'Entered Y'
    }
    Else {
        $global:anon = "no"
        #Install-Anonserver
        Install-ServerFiles
        Write-Host 'Entered N'
    }
}
Function New-TryagainNew {
    $title = 'Try again?'
    $question = "$command $serverfiles ?"
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Select-Steamer $command $serverfiles
        exit
    }
    Else {
        Write-Host 'Entered N'
        Set-Location $currentdir
        Exit
    }
}
Function New-TryagainSteam {
    $title = ' Install Successful?'
    $question = "Was the Install Successful?"
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Set-Location $currentdir
    }
    Else {
        Write-Host 'Entered N'
        Select-Steamer $command $serverfiles
        Exit
    }
}
Function New-TryagainSteamLogin {
    $title = ' Login Successful?'
    $question = "Was the Login Successful?"
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Set-Location $currentdir
    }
    Else {
        Write-Host 'Entered N'
        Set-Location $currentdir
        Exit
    }
}
Function Set-SteamInfoAppID {
    $title = 'Launch Script create'
    $question = 'Create Launch Script?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Set-VariablesPS
        Read-AppID
        Write-Host 'Entered Y'
    }
    Else {
        Write-Host 'Entered N'
    }
}
Function New-ServerFolderq {
    $title = 'Server Folder Name does not exist!'
    $question = 'Would you like to to create new Server Folder Name?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Select-Steamer install $serverfiles
        Get-createdvaribles
    }
    Else {
        Write-Host 'Entered N'
        Exit
    }
}
Function Get-OxideQ {
    $title = 'Download Oxide'
    $question = 'Download Oxide and install?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Get-Oxide
        Write-Host 'Entered Y'
    } 
    Else {
        Write-Host 'Entered N'
    }
}
Function Get-SourceMetaModQ {
    $title = 'Download MetaMod and SourceMod'
    $question = 'Download MetaMod, SourceMod and install?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Get-SourceMetaMod
        Write-Host 'Entered Y'
    } 
    Else {
        Write-Host 'Entered N'
    }
}
Function Get-InstallForgeQ {
    $title = 'Download Forge'
    $question = 'Download Forge and install?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Get-InstallForge
        Write-Host 'Entered Y'
    } 
    Else {
        Write-Host 'Entered N'
    }
}
Function Set-MonitorJob {
    $title = 'Create Monitor Task Job'
    $question = 'Run Task Whether user is logged on or not?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Get-ChecktaskUnreg
        New-MontiorJobBG
    }
    Else {
        Write-Host 'Entered N'
        Get-ChecktaskUnreg
        New-MontiorJob
    }
}
Function Set-RestartJob {
    $title = 'Create Restart Task Job'
    $question = 'Run Task Whether user is logged on or not?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Get-ChecktaskUnreg
        New-RestartJobBG
    }
    Else {
        Write-Host 'Entered N'
        Get-ChecktaskUnreg
        New-RestartJob
    }
} 
Function New-AppDataSave {
    $title = 'Game has Saves located in AppData'
    $question = 'Backup Appdata for server?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        New-backupAppdata
    } 
    Else {
        Write-Host 'Entered N'
        Exit
    }
}
Function Get-UserInput_old {
    Param([parameter(Position = 0)]$parm0,
        [parameter(Position = 1)]$parm1,
        [parameter(Position = 2)]$parm2,
        [parameter(Position = 3)]$parm3,
        [parameter(Position = 4)]$parm4,
        [parameter(Position = 5)]$parm5,
        [parameter(Position = 6)]$parm6,
        [parameter(Position = 7)]$parm7,
        [parameter(Position = 8)]$parm8,
        [parameter(Position = 9)]$parm9,
        [parameter(Position = 10)]$parm10,
        [parameter(Position = 11)]$parm11,
        [parameter(Position = 12)]$parm12,
        [parameter(Position = 13)]$parm13,
        [parameter(Position = 14)]$parm14,
        [parameter(Position = 15)]$parm15,
        [parameter(Position = 16)]$parm16,
        [parameter(Position = 17)]$parm17,
        [parameter(Position = 18)]$parm18,
        [parameter(Position = 19)]$parm19,
        [parameter(Position = 20)]$parm20,
        [parameter(Position = 21)]$parm21,
        [parameter(Position = 22)]$parm22,
        [parameter(Position = 23)]$parm23,
        [parameter(Position = 24)]$parm24,
        [parameter(Position = 25)]$parm25,
        [parameter(Position = 26)]$parm26,
        [parameter(Position = 27)]$parm27,
        [parameter(Position = 28)]$parm28)
    #Write-Host "$SMILEY_BLACK Press Enter to Accept default $SMILEY_BLACK" -F Y
    If ($parm0 -eq 1) {
        If ((${IP} = Read-Host -P(Write-Host "Enter Server IP, Press Enter to Accept default [$defaultIP]: "-F CY -N )) -eq '') { $IP = "$defaultIP" }Else { $IP }
    }
    If ($parm1 -eq 1) {
        If ((${PORT} = Read-Host -P(Write-Host "Enter Server PORT, Press Enter to Accept default [$defaultPORT]: "-F CY -N )) -eq '') { $PORT = "$defaultPORT" }Else { $PORT }
    }
    If ($parm2 -eq 1) {
        If ((${QUERYPORT} = Read-Host -P(Write-Host "Enter Server QUERY PORT, Press Enter to Accept default [$defaultQUERYPORT]: "-F CY -N )) -eq '') { $QUERYPORT = "$defaultQUERYPORT" }Else { $QUERYPORT }
    }
    If ($parm3 -eq 1) {
        If ((${RCONPORT} = Read-Host -P(Write-Host "Enter Server RCON PORT, Press Enter to Accept default [$defaultRCONPORT]: "-F CY -N )) -eq '') { $rconport = "$defaultRCONPORT" }Else { $rconport }
    }
    If ($parm4 -eq 1) {
        If ((${RCONPASSWORD} = Read-Host -P(Write-Host "Enter Server RCON PASSWORD, Press Enter to Accept default [$randompassword]: "-F CY -N )) -eq '') { $RCONPASSWORD = "$randompassword" }Else { $RCONPASSWORD }
    }
    If ($parm5 -eq 1) {
        If (($hostname = Read-Host -P(Write-Host "Enter Server HOSTNAME, Press Enter to Accept default [$env:USERNAME]: "-F CY -N )) -eq '') { $hostname = "$env:USERNAME" }Else { $hostname }
    }
    If ($parm6 -eq 1) {
        If (($serverpassword = Read-Host -P(Write-Host "Enter Server SERVER PASSWORD, Press Enter to Accept default [$defaultSERVERPASSWORD]: "-F CY -N )) -eq '') { $SERVERPASSWORD = "$defaultSERVERPASSWORD" }Else { $SERVERPASSWORD }
    }
    If ($parm7 -eq 1) {
        If (($maxplayers = Read-Host -P(Write-Host "Enter Server MAX PLAYERS, Press Enter to Accept default [$defaultMAXPLAYERS]: "-F CY -N )) -eq '') { $maxplayers = "$defaultMAXPLAYERS" }Else { $maxplayers }
    }
    If ($parm8 -eq 1) {
        If (($gslt = Read-Host -P(Write-Host "Enter Server GSLT, Press Enter to Accept default [$defaultGSLT]: "-F CY -N )) -eq '') { $gslt = "$defaultGSLT" }Else { $gslt }
    }
    If ($parm9 -eq 1) {
        If (($map = Read-Host -P(Write-Host "Enter Server MAP, Press Enter to Accept default [$defaultMAP]: "-F CY -N )) -eq '') { $map = "$defaultMAP" }Else { $map }
    }
    If ($parm10 -eq 1) {
        If (($clientport = Read-Host -P(Write-Host "Enter Server client port, Press Enter to Accept default [$defaultclientport]: "-F CY -N )) -eq '') { $clientport = "$defaultclientport" }Else { $clientport }
    }
    If ($parm11 -eq 1) {
        If (($sourcetvport = Read-Host -P(Write-Host "Enter Server source tv port, Press Enter to Accept default [$defaultsourcetvport]: "-F CY -N )) -eq '') { $sourcetvport = "$defaultsourcetvport" }Else { $sourcetvport }
    }
    If ($parm12 -eq 1) {
        If (($gamemode = Read-Host -P(Write-Host "Enter Server GAME MODE, Press Enter to Accept default [$defaultGAMEMODE]: "-F CY -N )) -eq '') { $gamemode = "$defaultGAMEMODE" }Else { $gamemode }
    }
    If ($parm13 -eq 1) {
        If (($diff = Read-Host -P(Write-Host "Enter Server Difficulty, Press Enter to Accept default [$defaultDIFF]: "-F CY -N )) -eq '') { $diff = "$defaultDIFF" }Else { $diff }
    }
    If ($parm14 -eq 1) {
        If (($adminpassword = Read-Host -P(Write-Host "Enter Server ADMIN PASSWORD, Press Enter to Accept default [$defaultADMINPASSWORD]: "-F CY -N )) -eq '') { $adminpassword = "$defaultADMINPASSWORD" }Else { $adminpassword }
    }
    If ($parm15 -eq 1) {
        If (($tickrate = Read-Host -P(Write-Host "Enter Server TICKRATE, Press Enter to Accept default [$tickrate]: "-F CY -N )) -eq '') { $tickrate = "$defaultTICKRATE" }Else { $tickrate }
    }
    If ($parm16 -eq 1) {
        If (($saveinterval= Read-Host -P(Write-Host "Enter Server SAVEINTERVAL, Press Enter to Accept default [$SAVEINTERVAL]: "-F CY -N )) -eq '') { $SAVEINTERVAL = "$defaultSAVEINTERVAL" }Else { $SAVEINTERVAL }
    }
    If ($parm17 -eq 1) {
        If (($worldsize = Read-Host -P(Write-Host "Enter Server WORLDSIZE, Press Enter to Accept default [$worldsize]: "-F CY -N )) -eq '') { $worldsize = "$defaultWORLDSIZE" }Else { $worldsize }
    }
    If ($parm18 -eq 1) {
        If (($seed = Read-Host -P(Write-Host "Enter Server SEED, Press Enter to Accept default [$seed]: "-F CY -N )) -eq '') { $seed = "$defaultSEED" }Else { $seed }
    }
    If ($parm19 -eq 1) {
        If (($rconweb = Read-Host -P(Write-Host "Enter Server RCONWEB, Press Enter to Accept default [$rconweb]: "-F CY -N )) -eq '') { $rconweb = "$defaultRCONWEB" }Else { $rconweb }
    }
    If ($parm20 -eq 1) {
        If (($steamID64 = Read-Host -P(Write-Host "Enter steamID64, Press Enter to Accept default [$steamID64]: "-F CY -N )) -eq '') { $steamID64 = "$defaultsteamID64" }Else { $steamID64 }
    }
    If ($parm21 -eq 1) {
        If (($galaxyname = Read-Host -P(Write-Host "Enter GALAXYNAME, Press Enter to Accept default [$galaxyname]: "-F CY -N )) -eq '') { $galaxyname = "$defaultGALAXYNAME" }Else { $galaxyname }
    }
    If ($parm22 -eq 1) {
        If (($mapgroup = Read-Host -P(Write-Host "Enter Server MAPGROUP, Press Enter to Accept default [$mapgroup]: "-F CY -N )) -eq '') { $mapgroup = "$defaultMAPGROUP" }Else { $mapgroup }
    }
    If ($parm23 -eq 1) {
        If (($gametype = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$gametype]: "-F CY -N )) -eq '') { $gametype = "$defaultGAMETYPE" }Else { $gametype }
    }
    If ($parm24 -eq 1) {
        If (($coopplayers = Read-Host -P(Write-Host "Enter Server COOPPLAYERS, Press Enter to Accept default [$coopplayers]: "-F CY -N )) -eq '') { $coopplayers = "$defaultCOOPPLAYERS" }Else { $coopplayers }
    }
    If ($parm25 -eq 1) {
        If (($sv_lan = Read-Host -P(Write-Host "Enter Server SV_LAN, Press Enter to Accept default [$sv_lan]: "-F CY -N )) -eq '') { $sv_lan = "$defaultSV_LAN" }Else { $sv_lan }
    }
    If ($parm26 -eq 1) {
        If (($workshop = Read-Host -P(Write-Host "Enter Server workshop, Press Enter to Accept default [$workshop]: "-F CY -N )) -eq '') { $workshop = "$defaultworkshop" }Else { $workshop }
    }
    If ($parm27 -eq 1) {
        If (($sv_pure = Read-Host -P(Write-Host "Enter Server SV_PURE, Press Enter to Accept default [$sv_pure]: "-F CY -N )) -eq '') { $sv_pure = "$defaultSV_PURE" }Else { $sv_pure }
    }
    If ($parm28 -eq 1) {
        If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
    }
    If ($parm29 -eq 1) {
        If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
    }
}
Function Get-UserInput {
    If ($version -eq 0) {
        #Write-Host "$SMILEY_BLACK Press Enter to Accept default $SMILEY_BLACK" -F Y
        Set-Console
        If ($ip) {
            $defaultip = "$ip"
            If (($global:IP = Read-Host -P(Write-Host "Enter Server IP, Press Enter to Accept default [$IP]: "-F CY -N )) -eq '') { $global:IP = "$defaultIP" }Else { $IP }
        }
        If ($port) {
            $defaultport = "$port" 
            If (($global:port = Read-Host -P(Write-Host "Enter Server PORT, Press Enter to Accept  [$PORT]: "-F CY -N )) -eq '') { $global:port = "$defaultPORT" }Else { $PORT }
        }
        If ($queryport) {
            $defaultquery = "$query"
            If (($global:queryport = Read-Host -P(Write-Host "Enter Server QUERY PORT, Press Enter to Accept  [$QUERYPORT]: "-F CY -N )) -eq '') { $global:QUERYPORT = "$defaultQUERYPORT" }Else { $QUERYPORT }
        }
        If ($rconport) {
            $defaultrconport = "$rconport"
            If (($global:rcon = Read-Host -P(Write-Host "Enter Server RCON PORT, Press Enter to Accept  [$rconport]: "-F CY -N )) -eq '') { $global:rconport = "$defaultrconport" }Else { $rconport }
        }
        If ($rconpassword ) {
            If (($global:rconpassword = Read-Host -P(Write-Host "Enter Server RCON PASSWORD, Press Enter to Accept  [$randompassword]: "-F CY -N )) -eq '') { $global:rconpassword = "$randompassword" }Else { $rconpassword }
        }
        If ($hostname) {

            If (($global:hostname = Read-Host -P(Write-Host "Enter Server HOSTNAME, Press Enter to Accept  [SERVERNAME]: "-F CY -N )) -eq '') { $global:hostname = "SERVERNAME" }Else { $hostname }
        }
        If ($serverpassword) {
            $defaultserverpassword = "$serverpassword"
            If (($global:serverpassword = Read-Host -P(Write-Host "Enter Server SERVER PASSWORD, Press Enter to Accept  [$serverpassword]: "-F CY -N )) -eq '') { $global:serverpassword = "$defaultserverpassword" }Else { $serverpassword }
        }
        If ($maxplayers) {
            $defaultmaxplayers = "$maxplayers"
            If (($global:maxplayers = Read-Host -P(Write-Host "Enter Server MAX PLAYERS, Press Enter to Accept  [$maxplayers]: "-F CY -N )) -eq '') { $global:maxplayers = "$defaultmaxplayers" }Else { $maxplayers }
        }
        If ($gslt) {
            $defaultgslt = "$gslt"
            If (($global:GSLT = Read-Host -P(Write-Host "Enter Server GSLT, Press Enter to Accept  [$gslt]: "-F CY -N )) -eq '') { $global:gslt = "$defaultgslt" }Else { $gslt }
        }
        If ($defaultmap) {
            $defaultdefaultmap = "$defaultmap"
            If (($global:defaultmap = Read-Host -P(Write-Host "Enter Server defaultmap, Press Enter to Accept  [$defaultmap]: "-F CY -N )) -eq '') { $global:defaultmap = "$defaultdefaultmap" }Else { $defaultmap }
        }
        If ($clientport) {
            $defaultclientport = "$clientport"
            If (($global:clientport = Read-Host -P(Write-Host "Enter Server client port, Press Enter to Accept  [$clientport]: "-F CY -N )) -eq '') { $global:clientport = "$defaultclientport" }Else { $clientport }
        }
        If ($sourcetvport) {
            $defaultsourcetvport = "$sourcetvport"
            If (($global:sourcetvport = Read-Host -P(Write-Host "Enter Server source tv port, Press Enter to Accept  [$sourcetvport]: "-F CY -N )) -eq '') { $global:sourcetvport = "$defaultsourcetvport" }Else { $sourcetvport }
        }
        If ($gamemode) {
            $defaultgamemode = "$gamemode"
            If (($global:gamemode = Read-Host -P(Write-Host "Enter Server GAME MODE, Press Enter to Accept  [$gamemode]: "-F CY -N )) -eq '') { $global:gamemode = "$defaultgamemode" }Else { $gamemode }
        }
        If ($diff ) {
            $defaultdiff = "$defaultdiff"
            If (($global:diff = Read-Host -P(Write-Host "Enter Server Difficulty, Press Enter to Accept  [$diff]: "-F CY -N )) -eq '') { $global:diff = "$defaultdiff" }Else { $diff }
        }
        If ($adminpassword) {
            $defaultadminpassword = "$adminpassword"
            If (($global:ADMINPASSWORD = Read-Host -P(Write-Host "Enter Server ADMIN PASSWORD, Press Enter to Accept  [$adminpassword]: "-F CY -N )) -eq '') { $global:adminpassword = "$defaultadminpassword" }Else { $adminpassword }
        }
        If ($tickrate) {
            $defaulttickrate = "$tickrate"
            If (($global:tickrate = Read-Host -P(Write-Host "Enter Server TICKRATE, Press Enter to Accept  [$tickrate]: "-F CY -N )) -eq '') { $global:tickrate = "$defaulttickrate" }Else { $tickrate }
        }
        If ($saveinterval) {
            $defaultsaveinterval = "$saveinterval"
            If (($global:saveinterval = Read-Host -P(Write-Host "Enter Server SAVEINTERVAL, Press Enter to Accept  [$saveinterval]: "-F CY -N )) -eq '') { $global:saveinterval = "$defaultsaveinterval" }Else { $saveinterval }
        }
        If ($worldsize) {
            $defaultworldsize = "$worldsize"
            If (($global:worldsize = Read-Host -P(Write-Host "Enter Server WORLDSIZE, Press Enter to Accept  [$worldsize]: "-F CY -N )) -eq '') { $global:worldsize = "$defaultworldsize" }Else { $worldsize }
        }
        If ($seed) {
            $defaultseed = "$seed"
            If (($global:SEED = Read-Host -P(Write-Host "Enter Server SEED, Press Enter to Accept  [$seed]: "-F CY -N )) -eq '') { $global:seed = "$defaultseed" }Else { $seed }
        }
        If ($rconweb) {
            $defaultrconweb = "$rconweb"
            If (($global:rconweb = Read-Host -P(Write-Host "Enter Server RCONWEB, Press Enter to Accept  [$rconweb]: "-F CY -N )) -eq '') { $global:rconweb = "$defaultrconweb" }Else { $rconweb }
        }
        If ($steamID64) {
            $defaultsteamID64 = "$steamID64"
            If (($global:steamID64 = Read-Host -P(Write-Host "Enter steamID64, Press Enter to Accept  [$steamID64]: "-F CY -N )) -eq '') { $global:steamID64 = "$defaultsteamID64" }Else { $steamID64 }
        }
        If ($galaxyname) {
            $defaultgalaxyname = "$galaxyname"
            If (($global:galaxyname = Read-Host -P(Write-Host "Enter GALAXYNAME, Press Enter to Accept  [$galaxyname]: "-F CY -N )) -eq '') { $global:galaxyname = "$defaultgalaxyname" }Else { $galaxyname }
        }
        If ($mapgroup) {
            $defaultmapgroup = "$mapgroup"
            If (($global:mapgroup = Read-Host -P(Write-Host "Enter Server MAPGROUP, Press Enter to Accept  [$mapgroup]: "-F CY -N )) -eq '') { $global:mapgroup = "$defaultmapgroup" }Else { $mapgroup }
        }
        If ($gametype) {
            $defaultgametype = "$gametype"
            If (($global:gametype = Read-Host -P(Write-Host "Enter Server gametype, Press Enter to Accept  [$gametype]: "-F CY -N )) -eq '') { $global:gametype = "$defaultgametype" }Else { $gametype }
        }
        If ($coopplayers) {
            $defaultcoopplayers = "$coopplayers"
            If (($global:coopplayers = Read-Host -P(Write-Host "Enter Server COOPPLAYERS, Press Enter to Accept  [$coopplayers]: "-F CY -N )) -eq '') { $global:coopplayers = "$defaultcoopplayers" }Else { $coopplayers }
        }
        If ($sv_lan) {
            $defaultsv_lan = "$sv_lan"
            If (($global:sv_lan = Read-Host -P(Write-Host "Enter Server SV_LAN, Press Enter to Accept  [$sv_lan]: "-F CY -N )) -eq '') { $global:sv_lan = "$defaultsv_lan" }Else { $sv_lan }
        }
        If ($workshop) {
            $defaultworkshop = "$workshop"
            If (($global:workshop = Read-Host -P(Write-Host "Enter Server workshop, Press Enter to Accept  [$workshop]: "-F CY -N )) -eq '') { $global:workshop = "$defaultworkshop" }Else { $workshop }
        }
        If ($sv_pure) {
            $defaultsv_pure = "$sv_pure"
            If (($global:sv_pure = Read-Host -P(Write-Host "Enter Server SV_PURE, Press Enter to Accept  [$sv_pure]: "-F CY -N )) -eq '') { $global:sv_pure = "$defaultsv_pure" }Else { $sv_pure }
        }
        If ($parm28 -eq 1) {
            If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
        }
        If ($parm29 -eq 1) {
            If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
        }
    }
}