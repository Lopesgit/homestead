#!/usr/bin/env bash

echo "Configuring timezone PHP..."

# PHP 5.6 FPM AND CLI
sudo sed -i -- "s/date.timezone = UTC/date.timezone = 'America\/Sao_Paulo'/g" /etc/php/5.6/cli/php.ini
sudo sed -i -- "s/date.timezone = UTC/date.timezone = 'America\/Sao_Paulo'/g" /etc/php/5.6/fpm/php.ini

# PHP 7.0 FPM AND CLI
sudo sed -i -- "s/date.timezone = UTC/date.timezone = 'America\/Sao_Paulo'/g" /etc/php/7.0/cli/php.ini
sudo sed -i -- "s/date.timezone = UTC/date.timezone = 'America\/Sao_Paulo'/g" /etc/php/7.0/fpm/php.ini

# PHP 7.1 FPM AND CLI
sudo sed -i -- "s/date.timezone = UTC/date.timezone = 'America\/Sao_Paulo'/g" /etc/php/7.1/cli/php.ini
sudo sed -i -- "s/date.timezone = UTC/date.timezone = 'America\/Sao_Paulo'/g" /etc/php/7.1/fpm/php.ini

# PHP 7.2 FPM AND CLI
sudo sed -i -- "s/date.timezone = UTC/date.timezone = 'America\/Sao_Paulo'/g" /etc/php/7.2/cli/php.ini
sudo sed -i -- "s/date.timezone = UTC/date.timezone = 'America\/Sao_Paulo'/g" /etc/php/7.2/fpm/php.ini


sudo service php5.6-fpm restart &> /dev/null
sudo service php7.0-fpm restart &> /dev/null
sudo service php7.1-fpm restart &> /dev/null
sudo service php7.2-fpm restart &> /dev/null