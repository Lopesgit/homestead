#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
# Check If nvm Has Been Installed

if [ -f /home/vagrant/.nvm ]
then
    echo "NVM already installed."
    exit 0
fi

# Downalod nvm via curl
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash