#!/bin/sh

# Set up app/etc/env.php
echo "" >>  /var/www/html/.bashrc
mv /var/www/env.php /var/www/html/app/etc/env.php
chown nginx:nginx /var/www/html/app/etc/env.php

mkdir -p /tmp/sourceguardian/
mkdir -p /usr/local/lib/php/extensions/no-debug-non-zts-20190902
mkdir -p /tmp/ioncube/

isArch="$(arch)"
archCode="aarch64"
if [ "$isArch" = "$archCode" ]; then
  curl --create-dirs -O --output-dir /tmp/sourceguardian https://www.sourceguardian.com/loaders/download/loaders.linux-aarch64.tar.gz
  curl --create-dirs -O --output-dir /tmp/ioncube https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_aarch64.tar.gz
  tar -xzf /tmp/sourceguardian/loaders.linux-aarch64.tar.gz -C /tmp/sourceguardian
  tar -xzf /tmp/ioncube/ioncube_loaders_lin_aarch64.tar.gz -C /tmp/ioncube
else
  curl --create-dirs -O --output-dir /tmp/sourceguardian https://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz
  curl --create-dirs -O --output-dir /tmp/ioncube http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
  tar -xzf /tmp/sourceguardian/loaders.linux-x86_64.tar.gz -C /tmp/sourceguardian
  tar -xzf /tmp/ioncube/ioncube_loaders_lin_x86-64.tar.gz -C /tmp/ioncube
fi

# Set up SourceGuardian
cp /tmp/sourceguardian/ixed.7.4.lin /usr/local/lib/php/extensions/no-debug-non-zts-20190902/ixed.7.4.lin
chmod 755 /usr/local/lib/php/extensions/no-debug-non-zts-20190902/ixed.7.4.lin
echo 'zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20190902/ixed.7.4.lin' > /usr/local/etc/php/conf.d/docker-php-ext-sourceguardian.ini

# Set up IonCube
mv /tmp/ioncube/ioncube/ioncube_loader_lin_7.4.so /usr/local/lib/php/extensions/no-debug-non-zts-20190902
echo 'zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20190902/ioncube_loader_lin_7.4.so' > /usr/local/etc/php/conf.d/docker-php-ext-ioncube.ini

# Install xDebug
if [[ -z "$xdebug" || "$xdebug" == "0" ]]; then
    echo "No xdebug"
else
    echo "Enabling xdebug"
    pecl install xdebug-3.1.5
    echo 'zend_extension=xdebug.so
xdebug.mode=develop,debug
xdebug.client_host=localhost
xdebug.start_with_request=trigger
xdebug.client_port="9003"
xdebug.start_with_request=yes
xdebug.connect_timeout_ms=2000
xdebug.start_upon_error=yes
xdebug.log=/tmp/xdebug.log
' > /usr/local/etc/php/conf.d/xdebug.ini
fi

# Install Blackfire 
if [[ -z "$blackfire" || "$blackfire" == "0" ]]; then
    echo "No blackfire"
else
    echo "Enabling blackfire"
    
    #Install blackfire
    apt install blackfire -y
    apt install blackfire-php -y
    service blackfire-agent stop
    chown -R nginx:nginx /etc/blackfire/
    mkdir -p /var/run/blackfire/ && chown -R nginx:nginx /var/run/blackfire/
    chmod -R 775 /var/run/blackfire
fi

# Start Mailhog 
if [[ -z "$mailhog" || "$mailhog" == "0" ]]; then
    echo "No mailhog"
else
    echo "Starting mailhog"
    /usr/bin/env /usr/local/bin/mailhog > /dev/null 2>&1 &
fi

# Start SSH
service ssh start

# Start Nginx
nginx

# Start php-fpm
php-fpm
