#!/bin/sh -e
DRIVER_NAME="node"
VERSION="0.1.4"
BASE_URL="https://raw.githubusercontent.com/summonbin/node"


###################
#### Arguments ####
###################

INSTALL_PATH=$1
SCHEME_PATH=$2
DEFAULT_CACHE_PATH=$3


######################
#### Build driver ####
######################

mkdir -p "$INSTALL_PATH/$DRIVER_NAME"
curl -L "$BASE_URL/$VERSION/scripts/setup.sh" -o "$INSTALL_PATH/$DRIVER_NAME/setup.sh"
curl -L "$BASE_URL/$VERSION/scripts/node.sh" -o "$INSTALL_PATH/$DRIVER_NAME/node.sh"
curl -L "$BASE_URL/$VERSION/scripts/run.sh" -o "$INSTALL_PATH/$DRIVER_NAME/run.sh"


######################
#### Build scheme ####
######################

mkdir -p "$SCHEME_PATH/$DRIVER_NAME/nvm"
if [ ! -f "$SCHEME_PATH/$DRIVER_NAME/nvm/cache" ]
then
  echo "$DEFAULT_CACHE_PATH/$DRIVER_NAME/nvm" > "$SCHEME_PATH/$DRIVER_NAME/nvm/cache"
fi
if [ ! -f "$SCHEME_PATH/$DRIVER_NAME/nvm/version" ]
then
  echo "v0.34.0" > "$SCHEME_PATH/$DRIVER_NAME/nvm/version"
fi
