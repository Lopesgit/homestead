#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
# Check If nvm Has Been Installed
NODE_VERSION=$1;

# Install node
if [ -f /home/vagrant/.nvm ]
then
	nvm install $NODE_VERSION;
	nvm use $NODE_VERSION;
fi
