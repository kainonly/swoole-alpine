FROM php:8.0.1-alpine

ENV SWOOLE_VERSION 4.6.2

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
    zlib \
    openssl \
    yaml

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    \
    linux-headers \
    git \
    make \
    automake \
    autoconf \
    gcc \
    g++ \
    zlib-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    bzip2-dev \
    libzip-dev \
    libxml2-dev \
    gmp-dev \
    openssl-dev \
    yaml-dev \
    \
    && docker-php-ext-install \
    \
    calendar \
    bz2 \
    zip \
    soap \
    iconv \
    exif \
    gmp \
    bcmath \
    sockets \
    mysqli \
    pdo_mysql \
    opcache \
    \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    \
    && pecl install redis yaml \
    && docker-php-ext-enable redis yaml \
    && mkdir -p /build \
    && cd /build \
    && git clone -b v${SWOOLE_VERSION} https://github.com/swoole/swoole-src.git \
    && cd swoole-src \
    && phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config \
    --enable-openssl \
    --enable-http2 \
    --enable-swoole-json \
    --enable-swoole-curl \
    && make && make install \
    && cd && rm -rf /build \
    && apk del .build-deps

RUN echo -e "extension=swoole\nswoole.use_shortname='Off'" > /usr/local/etc/php/conf.d/docker-php-ext-swoole.ini

VOLUME [ "/app" ]

CMD ["php", "-a"]
