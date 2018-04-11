#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
# Check If Git Has Been Installed

if [ -f /home/vagrant/.gitconfig ]
then
    echo "Git already installed."
    exit 0
fi

# Add Git PPA
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update

# Install Git
sudo apt-get install -y git

# Setting user name and e-mail
git config --global user.name "Renê Lopes de Barros"
git config --global user.email "rene.lopes@rkmsistemas.com.br"
