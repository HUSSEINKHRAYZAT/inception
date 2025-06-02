#!/bin/bash

# Wait until MariaDB is ready
until mysqladmin ping -h mariadb --silent; do
    echo "⏳ Waiting for MariaDB..."
    sleep 2
done

# Configure WordPress
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/${MYSQL_DATABASE}/" /var/www/html/wp-config.php
sed -i "s/username_here/${MYSQL_USER}/" /var/www/html/wp-config.php
sed -i "s/password_here/${MYSQL_PASSWORD}/" /var/www/html/wp-config.php
sed -i "s/localhost/mariadb/" /var/www/html/wp-config.php

chown -R www-data:www-data /var/www/html

php-fpm8.2 -F
