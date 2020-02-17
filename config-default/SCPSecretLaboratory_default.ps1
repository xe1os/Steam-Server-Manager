Function New-LaunchScriptSCPSecretLaboratoryserverPS {
    # SCP: Secret Laboratory Dedicated Server
    # 996560
    ################## Change Default Variables #################

    #                   Server Port 
    $global:PORT = "7777"

    ##############################/\##############################
    
    
    # 7777
    # config located in "$env:APPDATA\SCP Secret Laboratory\config\$global:PORT\config_gameplay.txt"
    
    # Requires  admin email for public server or will not run
    # contact_email: default

    # Your server won't be visible on the public server list -
    # If you are 100% sure that the server is working, can be accessed from the Internet 
    # and YOU WANT TO MAKE IT PUBLIC, please set up your email in configuration file ("contact_email" value) and restart the server.
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "LocalAdmin"
    $global:GAME = "protocol-valve"
    $global:SAVES = "SCP Secret Laboratory"
    $global:PROCESS = "LocalAdmin|SCPS"
    $global:SERVERCFGDIR = "$env:APPDATA\SCP Secret Laboratory\config\$global:PORT\config_gameplay.txt"
    $global:LOGDIR = "$env:APPDATA\SCP Secret Laboratory\ServerLogs\$global:PORT"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:config1 = ""

    $global:launchParams = '@("$global:EXE $global:PORT")'
}   