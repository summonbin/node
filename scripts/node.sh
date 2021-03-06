#!/bin/sh -e
###################
#### Arguments ####
###################

BASE_DIR=$(dirname "$0")
CONFIG_DIR=$1
TARGET_NODE_VERSION=$2

# Arguments for bin
BIN_ARGS=()

for i
do
  BIN_ARGS+=(\"${i}\")
done

unset BIN_ARGS[0]
unset BIN_ARGS[1]
BIN_ARGS=${BIN_ARGS[@]}


#######################
#### Setup Node.js ####
#######################

source "$BASE_DIR/setup.sh" "$CONFIG_DIR" "$TARGET_NODE_VERSION"


######################
#### Execute node ####
######################

if [ $(nvm version) != "$TARGET_NODE_VERSION" ]
then
  nvm install "$TARGET_NODE_VERSION"
fi
if [ -t 1 ]
then
  eval node $BIN_ARGS < /dev/tty
else
  eval node $BIN_ARGS
fi
