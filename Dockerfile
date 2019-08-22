FROM php:7.3.8-alpine

RUN apk add --no-cache gmp

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    \
    gmp-dev \
    \
    && docker-php-ext-install \
    \
    iconv \
    exif \
    gmp \
    bcmath \
    mysqli \
    pdo_mysql \
    opcache \
    && pecl install redis swoole \
    && docker-php-ext-enable redis swoole \
    && apk del .build-deps

WORKDIR /app