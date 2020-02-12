FROM php:7.4.2-alpine

WORKDIR /app

RUN apk add --no-cache \
    freetype \
    libjpeg-turbo \
    libpng \
    libstdc++ \
    libbz2 \
    bzip2 \
    libzip \
    libxml2 \
    gmp \
    enchant \
    openssl

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    bzip2-dev \
    libzip-dev \
    libxml2-dev \
    gmp-dev \
    enchant-dev \
    openssl-dev \
    \
    && docker-php-ext-install \
    \
    ffi \
    calendar \
    bz2 \
    zip \
    soap \
    iconv \
    exif \
    gmp \
    bcmath \
    enchant \
    sockets \
    mysqli \
    pdo_mysql \
    opcache \
    \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \ 
    && docker-php-ext-install -j$(nproc) gd \
    \
    && pecl install redis swoole \
    && docker-php-ext-enable redis swoole \
    && apk del .build-deps

RUN echo "swoole.use_shortname='Off'" >> /usr/local/etc/php/conf.d/docker-php-ext-swoole.ini

VOLUME [ "/app" ]

CMD ["php", "-a"]