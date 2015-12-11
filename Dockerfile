FROM php:5.6-apache

RUN a2enmod rewrite
RUN apt-get update && apt-get install -y php5-dev libmcrypt-dev git

RUN echo "Install PECL Mongo"
RUN pecl install mongo

RUN docker-php-ext-install mcrypt zip

RUN echo "extension=mongo.so" >> /usr/local/etc/php/php.ini

RUN echo "[Date]" >> /usr/local/etc/php/php.ini
RUN echo "date.timezone = Europe/Berlin" >> /usr/local/etc/php/php.ini

ADD docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
