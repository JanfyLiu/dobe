# Dobe
> Dobe is PHP development stack: Nginx, PHP-FPM, MySQL, MongoDB, Memcached, Redis, Node, Elasticsearch


Dobe WebServer gives you everything you need for developing PHP applications locally. I hope you'll find it as useful an addition to your dev-arsenal as I've found it!

## What's inside

* [Nginx](http://nginx.org/)
* [PHP-FPM](http://php-fpm.org/)
* [MySQL](http://www.mysql.com/)
* [MongoDB](http://www.mongodb.org/)
* [Memcached](http://memcached.org/)
* [Redis](http://redis.io/)
* [Node](https://nodejs.org/)
* [Elasticsearch](http://www.elasticsearch.org/)

## Requirements

* [Docker ToolBox](https://www.docker.com/docker-toolbox) (Mac and Windows only)

## Running

Set up a Docker Machine and then run:

```sh
$ make install
$ docker-compose up -d
```

That's it! You can now access your configured sites via the IP address of the Docker Machine or locally if you're running a Linux flavour and using Docker natively.

## License

Copyright &copy; 2016-2018 [Janfy](http://github.com/JanfyLiu). Licensed under the terms of the [MIT license](LICENSE.md).
