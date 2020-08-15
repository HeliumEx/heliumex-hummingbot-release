#!/usr/bin/pwsh

$isLinuxSubsystem = Test-Path -Path '/mnt/c'

$docker = 'docker';
if ($IsWindows -or $isLinuxSubsystem) {
    $docker = 'docker.exe'
}

# init
Function pause ($message) {
    # Check if running Powershell ISE
    if ($psISE) {
        Add-Type -AssemblyName System.Windows.Forms
        [System.Windows.Forms.MessageBox]::Show("$message")
    }
    else {
        Write-Host "$message" -ForegroundColor Yellow
        $x = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}

Function mkdir ($directory) {
    if(!(Test-Path $directory)) {
        New-Item $directory -Type Directory
    }
}

$PWD = (Get-Item -Path "./" -Verbose).FullName

$TAG = "latest"
$INSTANCE_NAME = "heliumex-hummingbot"
$FOLDER="data2"

Write-Host
Write-Host "Creating your hummingbot instance: $INSTANCE_NAME (heliumex/hummingbot:$TAG)"
Write-Host
Write-Host "Your files will be saved to:"
Write-Host "=> instance folder:    $(Join-Path $PWD $FOLDER)"
Write-Host "=> config files:       ├── $(Join-Path $PWD $FOLDER "hummingbot_conf")"
Write-Host "=> log files:          ├── $(Join-Path $PWD $FOLDER "hummingbot_logs")"
Write-Host "=> data file:          ├── $(Join-Path $PWD $FOLDER "hummingbot_data")"
Write-Host "=> scripts files:      └── $(Join-Path $PWD $FOLDER "hummingbot_scripts")"
Write-Host
pause "Press [Enter] to continue"

#
#
#
# =============================================
# EXECUTE SCRIPT
# 1) Create folder for your new instance
mkdir $FOLDER
# 2) Create folders for log and config files
mkdir (Join-Path $FOLDER "hummingbot_conf")
mkdir (Join-Path $FOLDER "hummingbot_logs")
mkdir (Join-Path $FOLDER "hummingbot_data")
mkdir (Join-Path $FOLDER "hummingbot_scripts")
# 3) Launch a new instance of hummingbot
docker run -it --log-opt max-size=10m --log-opt max-file=5 `
--name $INSTANCE_NAME `
--network host `
--mount "type=bind,source=$(Join-Path $PWD $FOLDER "hummingbot_conf"),destination=/conf/" `
--mount "type=bind,source=$(Join-Path $PWD $FOLDER "hummingbot_logs"),destination=/logs/" `
--mount "type=bind,source=$(Join-Path $PWD $FOLDER "hummingbot_data"),destination=/data/" `
--mount "type=bind,source=$(Join-Path $PWD $FOLDER "hummingbot_scripts"),destination=/scripts/" `
heliumex/hummingbot:$TAG