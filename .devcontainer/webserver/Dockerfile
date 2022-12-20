FROM ghcr.io/imagination-media/magento-k8s/php-fpm:7.4

RUN mkdir -p /var/www/html
RUN chown -R nginx:nginx /var/www/html

COPY sshd_config /etc/ssh/sshd_config

# Copy the welcome message
COPY welcome.txt /etc/motd

# Install NGINX
RUN apt install -y nginx

#Copy Nginx config
COPY nginx.conf /etc/nginx/nginx.conf
COPY magento.conf /etc/nginx/magento.conf

# Install phpcs
RUN curl --create-dirs -O --output-dir /usr/local/bin/ https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
RUN curl --create-dirs -O --output-dir /usr/local/bin/ https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
RUN chmod 775 /usr/local/bin/phpcs.phar
RUN chmod 775 /usr/local/bin/phpcbf.phar

# Copy app/etc/env.php
RUN mkdir -p /var/www/html/app/etc/
COPY env.php /var/www/env.php

# Execute the startup bash script on the startup
COPY startup.sh /root/init.sh
ENTRYPOINT ["/bin/bash", "/root/init.sh"]
