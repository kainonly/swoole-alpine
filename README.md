## Swoole Alpine

The PHP Swoole service Docker Image containing PHP Common Extensions

![MicroBadger Size](https://img.shields.io/microbadger/image-size/kainonly/swoole-alpine.svg?style=flat-square)
![MicroBadger Layers](https://img.shields.io/microbadger/layers/kainonly/swoole-alpine.svg?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/kainonly/swoole-alpine.svg?style=flat-square)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/kainonly/swoole-alpine.svg?style=flat-square)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/kainonly/swoole-alpine.svg?style=flat-square)

```shell
docker pull kainonly/swoole-alpine
```

Set docker-compose

```yaml
version: '3.7'
services:
  swoole:
    image: kainonly/swoole-alpine
    restart: always
    command: 'php /app/think swoole'
    volumes:
      - ./:/app
    ports:
      - 80:80
```

- `80` swoole listen port

Extensions:

- calendar
- bz2
- zip
- soap
- sockets
- iconv
- exif
- gmp
- bcmath
- enchant
- xmlrpc
- xsl
- mysqli
- pdo_mysql
- opcache
- gd
- redis
- mongodb
- msgpack
- swoole