FROM php:7.3.9-alpine

RUN apk add --no-cache \
    gmp \
    bzip2 \
    libzip \
    enchant

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    \
    gmp-dev \
    bzip2-dev \
    libzip-dev \
    enchant-dev \
    \
    && docker-php-ext-install \
    \
    bz2 \
    zip \
    sockets \
    iconv \
    exif \
    gmp \
    bcmath \
    enchant \
    mysqli \
    pdo_mysql \
    opcache \
    \
    && pecl install redis swoole \
    && docker-php-ext-enable redis swoole \
    && apk del .build-deps

WORKDIR /app