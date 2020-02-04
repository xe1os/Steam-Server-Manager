##################################
######## Default Settings ########
##################################
# DO NOT EDIT, ANY CHANGES WILL BE OVERWRITTEN!
# Copy settings from here and use them in either:
# common.cfg - applies settings to every instance.
# [instance].cfg - applies settings to a specific instance.

#### Game Server Settings ####

## Server Start Settings | https://docs.linuxgsm.com/configuration/start-parameters
$port="27015"
$clientport="27005"
$sourcetvport="27020"
$defaultmap="embassy_coop checkpoint"
$maxplayers="32"
$tickrate="64"

## Game Server Login Token (GSLT): Optional
# GSLT can be used for running a public server.
# More info: https://docs.linuxgsm.com/steamcmd/gslt
$gslt=""

## Server Start Command | https://docs.linuxgsm.com/configuration/start-parameters#additional-parameters
#fn_parms(){
#parms="-game insurgency -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} -tickrate ${tickrate} +sv_setsteamaccount ${gslt} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -workshop -norestart"
#}
$Params = '@("-console -game insurgency -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} -tickrate ${tickrate} +sv_setsteamaccount ${gslt} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -workshop -norestart")'
#### LinuxGSM Settings ####

## LinuxGSM Stats
# Send useful stats to LinuxGSM developers.
# https://docs.linuxgsm.com/configuration/linuxgsm-stats
# (on|off)
$stats="off"

## Notification Alerts
# (on|off)

# Display IP | https://docs.linuxgsm.com/alerts#display-ip
$displayip=""

# More info | https://docs.linuxgsm.com/alerts#more-info
postalert="off"
postdays="7"
posttarget="https://hastebin.com"

# Discord Alerts | https://docs.linuxgsm.com/alerts/discord
$discordalert="off"
$discordwebhook="webhook"

# Email Alerts | https://docs.linuxgsm.com/alerts/email
emailalert="off"
email="email@example.com"
emailfrom=""

# IFTTT Alerts | https://docs.linuxgsm.com/alerts/ifttt
iftttalert="off"
ifttttoken="accesstoken"
iftttevent="linuxgsm_alert"

# Mailgun Email Alerts | https://docs.linuxgsm.com/alerts/mailgun
mailgunalert="off"
mailguntoken="accesstoken"
mailgundomain="example.com"
mailgunemailfrom="alert@example.com"
mailgunemail="email@myemail.com"

# Pushbullet Alerts | https://docs.linuxgsm.com/alerts/pushbullet
pushbulletalert="off"
pushbullettoken="accesstoken"
channeltag=""

# Pushover Alerts | https://docs.linuxgsm.com/alerts/pushover
pushoveralert="off"
pushovertoken="accesstoken"

# Slack Alerts | https://docs.linuxgsm.com/alerts/slack
slackalert="off"
slackwebhook="webhook"

# Telegram Alerts | https://docs.linuxgsm.com/alerts/telegram
# You can add a custom cURL string eg proxy (useful in Russia) or else in "curlcustomstring".
# like a "--socks5 ipaddr:port" for socks5 proxy see more in "curl --help", if you not need
# any custom string in curl - simple ignore this parameter.
telegramalert="off"
telegramtoken="accesstoken"
telegramchatid=""
curlcustomstring=""

## Updating | https://docs.linuxgsm.com/commands/update
$updateonstart="off"

## Backup | https://docs.linuxgsm.com/commands/backup
$maxbackups="4"
$maxbackupdays="30"
$stoponbackup="on"

## Logging | https://docs.linuxgsm.com/features/logging
$consolelogging="on"
$logdays="7"

## Monitor | https://docs.linuxgsm.com/commands/monitor
# Query delay time
querydelay="1"

## ANSI Colors | https://docs.linuxgsm.com/features/ansi-colors
ansi="on"

#### Advanced Settings ####

## Message Display Time | https://docs.linuxgsm.com/features/message-display-time
$sleeptime="0.5"

## SteamCMD Settings | https://docs.linuxgsm.com/steamcmd
# Server appid
$appid="237410"
# SteamCMD Branch | https://docs.linuxgsm.com/steamcmd/branch
$branch=""
# Master Server | https://docs.linuxgsm.com/steamcmd/steam-master-server
steammaster="false"

## Stop Mode | https://docs.linuxgsm.com/features/stop-mode
# 1: tmux kill
# 2: CTRL+c
# 3: quit
# 4: quit 120s
# 5: stop
# 6: q
# 7: exit
# 8: 7 Days to Die
# 9: Gold Source
# 10: Teamspeak 3
stopmode="3"

## Query mode
# 1: session only
# 2: gamedig + gsquery
# 3: gamedig
# 4: gsquery
# 5: tcp
querymode="2"
$querytype="protocol-valve"

## Game Server Details
# Do not edit
$gamename="Insurgency"
engine="source"
glibc="2.15"

#### Directories ####
# Edit with care

## Game Server Directories
$systemdir="${serverfiles}/insurgency"
$executabledir="${serverfiles}"
$executable="./srcds_run"
$servercfg="${selfname}.cfg"
$servercfgdefault="server.cfg"
$servercfgdir="${systemdir}/cfg"
$servercfgfullpath="${servercfgdir}/${servercfg}"

## Backup Directory
$backupdir="${ssmdir}/backup"

## Logging Directories
$logdir="${rootdir}/log"
$gamelogdir="${systemdir}/logs"
$lgsmlogdir="${logdir}/script"
$consolelogdir="${logdir}/console"
$lgsmlog="${lgsmlogdir}/${selfname}-script.log"
$consolelog="${consolelogdir}/${selfname}-console.log"
$alertlog="${lgsmlogdir}/${selfname}-alert.log"
postdetailslog="${lgsmlogdir}/${selfname}-postdetails.log"

## Logs Naming
$lgsmlogdate="${lgsmlogdir}/${selfname}-script-$(date '+%Y-%m-%d-%H:%M:%S').log"
$consolelogdate="${consolelogdir}/${selfname}-console-$(date '+%Y-%m-%d-%H:%M:%S').log"
