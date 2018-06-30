#!/bin/sh
####################
#### Dependency ####
####################
NVM_REPO_URL="https://github.com/creationix/nvm"


###################
#### Arguments ####
###################

CONFIG_DIR=$1
TARGET_NODE_VERSION=$2


#####################
#### Read config ####
#####################

NVM_CACHE_DIR=$(<$CONFIG_DIR/nvm/cache)
NVM_VERSION=$(<$CONFIG_DIR/nvm/version)


##############################
#### Check version system ####
##############################

if [ "$TARGET_NODE_VERSION" = "system" ]
then
  return
fi


###################
#### Setup nvm ####
###################

NVM_REPO_DIR=$NVM_CACHE_DIR/$NVM_VERSION
NVM_SH=$NVM_REPO_DIR/nvm.sh

# Clone nvm
if [ ! -f "$NVM_SH" ]
then
  rm -rf $NVM_REPO_DIR
  git clone $NVM_REPO_URL $NVM_REPO_DIR -b $NVM_VERSION --single-branch --depth 1
fi

# Setup nvm
export NVM_DIR=$(realpath "$NVM_REPO_DIR")
source $NVM_SH
