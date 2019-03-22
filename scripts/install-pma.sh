#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

PMA_VERSION=$1;
PMA_PHP_VERSION=$2

echo 'Downloading phpMyAdmin'
curl -#L https://files.phpmyadmin.net/phpMyAdmin/$PMA_VERSION/phpMyAdmin-$PMA_VERSION-all-languages.tar.gz -o phpmyadmin.tar.gz

mkdir phpmyadmin && tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1

cp $(pwd)/phpmyadmin/config.sample.inc.php $(pwd)/phpmyadmin/config.inc.php

sed -i "s/$cfg\['blowfish_secret'\] = ''/$cfg\['blowfish_secret'\] = '$(php -r  "echo sha1(uniqid(rand(), true));")'/" $(pwd)/phpmyadmin/config.inc.php

mkdir $(pwd)/phpmyadmin/tmp

mysql -uhomestead -psecret < phpmyadmin/sql/create_tables.sql

rm phpmyadmin.tar.gz

CMD=/vagrant/scripts/serve-laravel.sh
CMD_CERT=/vagrant/scripts/create-certificate.sh

if [ ! -f $CMD ]; then
    # Fallback for older Homestead versions
    CMD=/vagrant/scripts/serve.sh
else
    # Create an SSL certificate
    sudo bash $CMD_CERT phpmyadmin.web
fi

sudo bash $CMD phpmyadmin.web $(pwd)/phpmyadmin 80 443 $PMA_PHP_VERSION

sudo service nginx reload