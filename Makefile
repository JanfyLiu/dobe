NAME = dobe
VERSION = 0.0.1
DL_DIR = ./images/php/pkg/

install:
	docker-compose build
stopall:
	docker stop $(docker ps -a -q)
clean:
	docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
pull:
	docker pull nginx:1.9.0
	docker pull php:5.6-fpm
	docker pull memcached:1.4
	docker pull mysql:5.6
	docker pull node:4.2.4
	docker pull redis:3.0
	docker pull mongo:3.2
	docker pull elasticsearch:2.1.0

dl:
	wget https://pecl.php.net/get/memcached-2.1.0.tgz -O $(DL_DIR)memcached.tgz
	wget https://pecl.php.net/get/memcache-3.0.8.tgz -O $(DL_DIR)memcache.tgz
	wget https://pecl.php.net/get/apcu-4.0.10.tgz -O $(DL_DIR)apcu.tgz
	wget https://pecl.php.net/get/msgpack-0.5.6.tgz -O $(DL_DIR)msgpack.tgz
	wget https://pecl.php.net/get/xdebug-2.3.3.tgz -O $(DL_DIR)xdebug.tgz
	wget https://pecl.php.net/get/xhprof-0.9.4.tgz -O $(DL_DIR)xhprof.tgz
	wget https://pecl.php.net/get/mongo-1.6.0.tgz -O $(DL_DIR)mongo.tgz
	wget https://pecl.php.net/get/redis-2.2.7.tgz -O $(DL_DIR)redis.tgz
	wget https://pecl.php.net/get/gearman-1.1.2.tgz -O $(DL_DIR)gearman.tgz
	wget https://getcomposer.org/composer.phar -O $(DL_DIR)composer.phar
	wget https://github.com/phalcon/cphalcon/archive/phalcon-v2.0.9.tar.gz -O $(DL_DIR)cphalcon.tgz
