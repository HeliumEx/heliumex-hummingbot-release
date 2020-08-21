#!/bin/bash

# init
function pause() {
  read -p "$*"
}

TAG="latest"

INSTANCE_NAME="heliumex-hummingbot"
FOLDER="data"

echo
echo "Creating your hummingbot instance: \"$INSTANCE_NAME\" (heliumex/hummingbot:$TAG)"
echo
echo "Your files will be saved to:"
echo "=> instance folder:    $PWD/$FOLDER"
echo "=> config files:       ├── $PWD/$FOLDER/hummingbot_conf"
echo "=> log files:          ├── $PWD/$FOLDER/hummingbot_logs"
echo "=> data file:          ├── $PWD/$FOLDER/hummingbot_data"
echo "=> scripts files:      └── $PWD/$FOLDER/hummingbot_scripts"
echo
pause Press [Enter] to continue

#
#
#
# =============================================
# EXECUTE SCRIPT
# 1) Create folder for your new instance
mkdir $FOLDER
# 2) Create folders for log and config files
mkdir $FOLDER/hummingbot_conf
mkdir $FOLDER/hummingbot_logs
mkdir $FOLDER/hummingbot_data
mkdir $FOLDER/hummingbot_scripts
# 3) Launch a new instance of hummingbot

docker pull heliumex/hummingbot:$TAG

docker run -it --log-opt max-size=10m --log-opt max-file=5 \
--name $INSTANCE_NAME \
--network host \
--mount "type=bind,source=$(pwd)/$FOLDER/hummingbot_conf,destination=/conf/" \
--mount "type=bind,source=$(pwd)/$FOLDER/hummingbot_logs,destination=/logs/" \
--mount "type=bind,source=$(pwd)/$FOLDER/hummingbot_data,destination=/data/" \
--mount "type=bind,source=$(pwd)/$FOLDER/hummingbot_scripts,destination=/scripts/" \
heliumex/hummingbot:$TAG