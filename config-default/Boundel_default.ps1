Function New-LaunchScriptboundelserverPS {
    # Boundel Server
    # 454070
    $global:MODDIR = ""
    $global:EXE = "world"
    $global:EXEDIR = "Datcha_Server"
    $global:GAME = "protocol-valve"
    $global:PROCESS = "world"
    Get-StopServerInstall
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -batchmode")'
}