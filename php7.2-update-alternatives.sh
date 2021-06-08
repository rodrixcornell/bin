#!/usr/bin/env bash

PHP_VERSION_MIN=7.2

if [ $(lsb_release -si) = Ubuntu ];
	then echo -e $(lsb_release -si)
		if [ ! -e "/etc/apt/sources.list.d/ondrej-ubuntu-php-bionic.list" ];
			then sudo -E LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
		fi
	else echo -e $(lsb_release -si)
		if [ ! -e "/etc/apt/sources.list.d/ondrej-php.list" ];
			then sudo -E apt -y install apt-transport-https lsb-release ca-certificates curl
				sudo -E wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
				sudo -E sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/ondrej-php.list'
		fi
fi
sudo -E apt update

echo "Checking for php${PHP_VERSION_MIN}..."
if command -v php${PHP_VERSION_MIN} > /dev/null; then
	echo "Detected php${PHP_VERSION_MIN}..."
else
	echo "Installing php${PHP_VERSION_MIN}..."
	sudo -E apt install -q -y php${PHP_VERSION_MIN}-{bcmath,cli,dev,mbstring,mysql,sqlite*,xml} && \
	sudo -E apt autoclean -y && \
	sudo -E apt autoremove -y
fi

echo -e "php${PHP_VERSION_MIN} Update Alternatives\r";
sudo -E update-alternatives --set php-config /usr/bin/php-config${PHP_VERSION_MIN} && \
sudo -E update-alternatives --set phpize /usr/bin/phpize${PHP_VERSION_MIN} && \
sudo -E update-alternatives --set php /usr/bin/php${PHP_VERSION_MIN} && \
sudo -E update-alternatives --set phar /usr/bin/phar${PHP_VERSION_MIN} && \
sudo -E update-alternatives --set phar.phar /usr/bin/phar.phar${PHP_VERSION_MIN}
PHP_VERSION=$(echo $(php -v | grep -i cli | cut -c5-10 | sed "s/-//"))
echo ${PHP_VERSION}
PHP_VERSION_MIN=$(php -v | grep -i cli | cut -c5-7)
echo ${PHP_VERSION_MIN}

{ \
echo "[Date]"; \
echo "; Defines the default timezone used by the date functions"; \
echo "; http://php.net/date.timezone"; \
echo "; https://www.php.net/manual/pt_BR/timezones.america.php"; \
echo "; priority=20"; \
echo "date.timezone = \"America/Manaus\""; \
} | sudo -E tee /etc/php/${PHP_VERSION_MIN}/mods-available/date.ini && \
sudo -E phpenmod -v ${PHP_VERSION_MIN} date && \
php -i | grep -i date