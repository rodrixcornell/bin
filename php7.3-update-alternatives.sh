#!/usr/bin/env bash

echo -e "php7.3 Update Alternatives\r";
sudo -E update-alternatives --set php-config /usr/bin/php-config7.3 && \
sudo -E update-alternatives --set phpize /usr/bin/phpize7.3 && \
sudo -E update-alternatives --set php /usr/bin/php7.3 && \
sudo -E update-alternatives --set phar /usr/bin/phar7.3 && \
sudo -E update-alternatives --set phar.phar /usr/bin/phar.phar7.3
PHP_VERSION=$(echo $(php -v | grep -i cli | cut -c5-10 | sed "s/-//"))
echo ${PHP_VERSION}
PHP_VERSION_MIN=$(php -v | grep -i cli | cut -c5-7)
echo ${PHP_VERSION_MIN}