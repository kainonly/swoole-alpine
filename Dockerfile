FROM php:7.3.10-alpine

WORKDIR /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache \
    gettext \
    libstdc++ \
    libbz2 \
    bzip2 \
    libzip \
    openssl

RUN apk add --no-cache --virtual .build-deps \
    file git autoconf automake libtool gettext-dev g++ make texinfo curl \
    && cd /root \
    && git clone https://github.com/emcrisostomo/fswatch.git \
    && cd fswatch \
    && ./autogen.sh \
    && ./configure \
    && make -j \
    && make install \
    && rm -rf /root/fswatch \
    && apk del .build-deps

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