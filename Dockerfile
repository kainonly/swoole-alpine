FROM php:7.4.0-alpine

WORKDIR /app

RUN apk add --no-cache \
    libstdc++ \
    libbz2 \
    bzip2 \
    libzip \
    openssl

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    \
    bzip2-dev \
    openssl-dev \
    \
    && docker-php-ext-install \
    \
    bz2 \
    iconv \
    sockets \
    mysqli \
    pdo_mysql \
    opcache \
    && pecl install redis swoole \
    && docker-php-ext-enable redis swoole \
    && apk del .build-deps

RUN echo "swoole.use_shortname='Off'" >> /usr/local/etc/php/conf.d/docker-php-ext-swoole.ini

VOLUME [ "/app" ]

CMD ["php", "-a"]