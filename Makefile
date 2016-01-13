ns = dobe
work_dir = ~/work
dl_dir = ./dockerfiles/php/sources

pull:
	docker pull nginx:1.9.0
	docker pull php:5.6-fpm
	docker pull memcached:1.4
	docker pull mysql:5.6
	docker pull node:0.12
	docker pull redis:3.0

build:
	make build-nginx
	make build-mysql
	make build-php
	make build-node
	make build-memcache

build-nginx:
	docker build -t dobe/nginx ./dockerfiles/nginx
run-nginx:
	docker run -i -d -p 80:80 -v ~/work:/opt -t dobe/nginx
build-php:
	docker build -t dobe/php ./dockerfiles/php
run-php:
	docker run -i -d -p 9000:9000 -v ~/work:/opt -t dobe/php
build-mysql:
	docker build -t dobe/mysql ./dockerfiles/mysql
run-mysql:
	docker run -i -d -p 3306:3306 -v ~/work/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t dobe/mysql
build-node:
	docker build -t dobe/node ./dockerfiles/node
run-node:
	docker run -i -d -p 8001:8001 -v ~/work:/opt -t dobe/node
build-memcache:
		docker build -t dobe/memcache ./dockerfiles/memcache
run-memcache:
		docker run -i -d -p 11211:11211 -v ~/work:/opt -t dobe/memcache


stopall:
	docker stop $(docker ps -a -q)
clean:
	docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")

dl:
	wget https://pecl.php.net/get/memcached-2.1.0.tgz -O ./dockerfiles/php/sources/memcached.tgz
	wget https://pecl.php.net/get/memcache-3.0.8.tgz -O ./dockerfiles/php/sources/memcache.tgz
	wget https://pecl.php.net/get/apcu-4.0.10.tgz -O ./dockerfiles/php/sources/apcu.tgz
	wget https://pecl.php.net/get/msgpack-0.5.6.tgz -O ./dockerfiles/php/sources/msgpack.tgz
	wget https://pecl.php.net/get/xdebug-2.3.3.tgz -O ./dockerfiles/php/sources/xdebug.tgz
	wget https://pecl.php.net/get/xhprof-0.9.4.tgz -O ./dockerfiles/php/sources/xhprof.tgz
	wget https://pecl.php.net/get/mongo-1.6.0.tgz -O ./dockerfiles/php/sources/mongo.tgz
	wget https://pecl.php.net/get/redis-2.2.7.tgz -O ./dockerfiles/php/sources/redis.tgz
	wget https://pecl.php.net/get/gearman-1.1.2.tgz -O ./dockerfiles/php/sources/gearman.tgz
	wget https://getcomposer.org/composer.phar -O ./dockerfiles/php/sources/composer.phar
	wget https://github.com/phalcon/cphalcon/archive/phalcon-v2.0.9.tar.gz -O ./dockerfiles/php/sources/cphalcon.tgz
