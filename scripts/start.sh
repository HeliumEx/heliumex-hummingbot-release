#!/bin/bash

INSTANCE_NAME="heliumex-hummingbot"

docker start $INSTANCE_NAME && docker attach $INSTANCE_NAME