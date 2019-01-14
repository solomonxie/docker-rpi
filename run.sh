#!/bin/bash

cp /config/webdav.conf /etc/apache2/sites-available/webdav.conf

mkdir -p /var/lock/apache2; chown www-data /var/lock/apache2 && \
mkdir -p /var/www/webdav; chown www-data /var/www/webdav && \
a2ensite webdav

export APACHE_RUN_USER="www-data"
export APACHE_RUN_GROUP="www-data"
export APACHE_LOG_DIR="/var/log/apache2"
export APACHE_PID_FILE="/var/run/apache2.pid"
export APACHE_LOCK_DIR="/var/lock/apache2"
export APACHE_RUN_DIR="/var/run/apache2"

htpasswd -cb /etc/apache2/webdav.password $USERNAME $PASSWORD
chown $USERNAME:www-data /etc/apache2/webdav.password
chmod 640 /etc/apache2/webdav.password

apache2 -D FOREGROUND
