FROM alpine:edge

RUN apk add --no-cache \
    php7 \
    php7-common \
    php7-mbstring \
    php7-iconv \
    php7-curl \
    php7-bz2 \
    php7-json \
    php7-ctype \
    php7-mysqli \
    php7-mysqlnd \
    php7-openssl \
    php7-opcache \
    php7-pdo \
    php7-pdo_mysql \
    php7-pecl-swoole --repository https://mirrors.aliyun.com/alpine/edge/testing/

WORKDIR /app
CMD ["php", "-a"]