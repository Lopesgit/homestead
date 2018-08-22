#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo 'Downloading phpMyAdmin 4.7.9'
curl -#L https://files.phpmyadmin.net/phpMyAdmin/4.7.9/phpMyAdmin-4.7.9-english.tar.gz -o phpmyadmin.tar.gz

mkdir phpmyadmin && tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1

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

sudo bash $CMD phpmyadmin.web $(pwd)/phpmyadmin

sudo service nginx reload