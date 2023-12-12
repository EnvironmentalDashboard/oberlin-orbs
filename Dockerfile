FROM php:8.1.4-apache

WORKDIR /var/www/html

ARG APP_ENV

ENV DEBIAN_FRONTEND=noninteractive TZ=America/New_York COMPOSER_ALLOW_SUPERUSER=1 APP_ENV=${APP_ENV}

# RUN mv .env.example .env

RUN apt-get update && apt-get install -y zlib1g-dev libzip-dev

RUN docker-php-ext-install zip pdo_mysql

RUN a2enmod rewrite headers 

COPY . .

# Ensure permissions to storage folder.
# RUN chown -R pratyush:pratyush /var/www/html
RUN chown -R www-data:www-data *
RUN chmod -R 755 *
