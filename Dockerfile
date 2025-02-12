FROM php:8.1-apache

RUN apt-get update \
    && apt-get install -y git libpq-dev libzip-dev

RUN docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql

RUN docker-php-ext-install \
    mysqli \
    pgsql \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite
