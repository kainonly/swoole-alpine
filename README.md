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

For example, docker-compose of hyperf

```yaml
version: '3.7'
services:
  swoole:
    image: kainonly/swoole-alpine
    restart: always
    command: 'php bin/hyperf.php start'
    volumes:
      - ./:/app
    ports:
      - 9501:9501
```

Set nodemon to do a hot restart

```json
{
  "verbose": true,
  "watch": [
    "app",
    "config",
  ],
  "exec": "docker-compose restart swoole",
  "ext": "php"
}
```