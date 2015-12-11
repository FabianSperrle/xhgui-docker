#!/bin/bash
set -e

echo "Install XHGui frontend"
curl -sL https://github.com/FabianSperrle/xhgui/archive/2.0.tar.gz | tar xzv
chown -R www-data:www-data xhgui-2.0
cd xhgui-2.0
echo "Install it"
php install.php

sed -i "s+DocumentRoot.*+DocumentRoot /var/www/html/xhgui-2.0/webroot/+g" /etc/apache2/apache2.conf

exec "$@"
