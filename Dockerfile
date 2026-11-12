FROM php:8.3-apache

COPY . /var/www/html/sheiley-shop-api

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git \
    zip \
    unzip \
    libsqlite3-dev \
    libsodium-dev && \
    docker-php-ext-install pdo_mysql sodium && \
    docker-php-ext-enable pdo_mysql sodium

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN a2enmod rewrite

# Set correct DocumentRoot
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/sheiley-shop-api|' /etc/apache2/sites-enabled/000-default.conf
RUN sed -i 's|<Directory /var/www/>|<Directory /var/www/html/sheiley-shop-api>|' /etc/apache2/conf-enabled/docker-php.conf

EXPOSE 80

WORKDIR /var/www/html/sheiley-shop-api
RUN composer install --no-dev --optimize-autoloader