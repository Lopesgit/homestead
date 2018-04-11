#!/usr/bin/env bash

echo "Configuring timezone ..."

# Server
sudo cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# sudo unlink /etc/localtime
# sudo echo "America/Sao_Paulo" > /etc/timezone
# sudo dpkg-reconfigure -f noninteractive tzdata &> /dev/null