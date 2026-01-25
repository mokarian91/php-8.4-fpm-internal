# Internal PHP 8.4 FPM base image
FROM php:8.4-fpm-alpine

RUN apk add --no-cache \
    bash \
    libzip-dev \
    oniguruma-dev \
    unzip \
    icu-dev \
    zlib-dev \
    mariadb-dev \
    mariadb-client \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    curl \
    git \
    openssl \
    libssl3 \
    libressl \
    linux-headers \
    $PHPIZE_DEPS \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    zip \
    intl \
    mbstring \
    opcache \
    exif \
    ftp \
    sockets \
    bcmath \
    gd \
    && pecl install redis \
    && docker-php-ext-enable redis

# Environment variables
ENV APP_ENV=production
ENV APP_DEBUG=false

RUN rm -rf /var/cache/apk/* /tmp/pear

# Working dir
WORKDIR /var/www/html
