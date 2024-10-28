FROM php:7.4-apache

WORKDIR /var/www/html

COPY . /var/www/html

RUN docker-php-ext-install mysqli

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80


