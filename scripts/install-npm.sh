#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
# Check If nvm Has Been Installed
NPM_VERSION=$1;

# Install node
npm install -g npm@$NPM_VERSION;