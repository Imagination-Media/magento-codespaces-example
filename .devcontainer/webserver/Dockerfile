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

# Blackfire
RUN wget -q -O - https://packages.blackfire.io/gpg.key | dd of=/usr/share/keyrings/blackfire-archive-keyring.asc
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/blackfire-archive-keyring.asc] http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list
RUN apt update

# Install oh-my-zsh
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -t https://github.com/denysdovhan/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions

# Set oh-my-zsh as default shell and make some adjustments
RUN chsh -s /bin/zsh nginx
ENV ZDOTDIR=/var/www/.oh-my-zsh/config
RUN mv /root/.oh-my-zsh /var/www/.oh-my-zsh
RUN mkdir -p /var/www/.oh-my-zsh/config
COPY .zshrc /var/www/.oh-my-zsh/config/.zshrc
COPY .zcompdump /var/www/.oh-my-zsh/config/.zcompdump
RUN chown -R nginx:nginx /var/www/.oh-my-zsh

# Execute the startup bash script on the startup
COPY startup.sh /root/init.sh
ENTRYPOINT ["/bin/bash", "/root/init.sh"]
