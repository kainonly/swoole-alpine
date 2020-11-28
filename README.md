## Swoole Alpine

The PHP Swoole service Docker Image containing PHP Common Extensions

![MicroBadger Size](https://img.shields.io/microbadger/image-size/kainonly/swoole-alpine.svg?style=flat-square)
![MicroBadger Layers](https://img.shields.io/microbadger/layers/kainonly/swoole-alpine.svg?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/kainonly/swoole-alpine.svg?style=flat-square)
[![Github Actions](https://img.shields.io/github/workflow/status/docker-maker/swoole-alpine/release?style=flat-square)](https://github.com/docker-marker/swoole-alpine/actions)

```shell
docker pull kainonly/swoole-alpine
```

For example, docker-compose of hyperf

```yaml
version: '3.8'
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