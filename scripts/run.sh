#!/bin/sh
###################
#### Arguments ####
###################

BASE_DIR=$(dirname "$0")
CONFIG_DIR=$1
BIN_NAME=$2
TARGET_NODE_VERSION=$3
PACKAGE_NAME=$4
TARGET_PACKAGE_VERSION=$5

# Arguments for bin
BIN_ARGS=("$@")
unset BIN_ARGS[0]
unset BIN_ARGS[1]
unset BIN_ARGS[2]
unset BIN_ARGS[3]
unset BIN_ARGS[4]
BIN_ARGS=${BIN_ARGS[@]}


#######################
#### Setup Node.js ####
#######################

source "$BASE_DIR/setup.sh" "$CONFIG_DIR" "$TARGET_NODE_VERSION"


#############################
#### Execute npm package ####
#############################

nvm install "$TARGET_NODE_VERSION"
npm install -g "$PACKAGE_NAME@$TARGET_PACKAGE_VERSION"
if [ -t 1 ]
then
  $BIN_NAME $BIN_ARGS < /dev/tty
else
  $BIN_NAME $BIN_ARGS
fi
