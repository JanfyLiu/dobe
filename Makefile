# 扩展文件路径
ASSETS = ./images/php/pkg/
# daocloud的加速监测，换成你自己的
DAOMONIT = curl -sSL https://get.daocloud.io/daomonit/install.sh | sh -s 433eaf4bd42e6fd80c3de4a1f9758b6b4d7afb1f
# 加速pull image
IMAGES_PULL = "$(DAOMONIT)\
&& dao pull debian:jessie \
&& dao pull elasticsearch:2.1.0 \
&& dao pull memcached:1.4 \
&& dao pull mongo:3.2 \
&& dao pull mysql:5.6 \
&& dao pull nginx:1.9.0 \
&& dao pull node:6.0.0 \
&& dao pull php:5.6-fpm \
&& dao pull php:7.0.6-fpm \
&& dao pull redis:3.0 \
&& dao pull solr:5.4.1 "

HOSTS =

pull:
	docker-machine ssh default $(IMAGES_PULL)
build:
	docker-compose build
install:
	docker-machine ssh default $(IMAGES_PULL)
	docker-compose build
env:
	docker-machine env default sudo echo ${HOSTS} > /etc/hosts
run:
	docker run -p 16379:16379 -v ./volumes/data/ssdb:/var/lib/ssdb -it dobe_ssdb /bin/bash
up:
	docker-compose up -d
restart:
	docker-machine restart default && eval $(shell docker-machine env default)
stop:
	docker-compose stop
rmi:
	docker rmi -f $(docker images -a | grep '<none>' | awk "{print \$3}")

php5:
	clear && docker exec -it php5 bash
web:
	clear && docker exec -it php5 php youzan/scrm-web/bin/httpd
api-proxy:
	clear && docker exec -it php5 php youzan/nova-http-proxy/bin/httpd
api:
	clear && docker exec -it php5 php youzan/scrm-api/bin/nova
tail:
	tail -f ./volumes/logs/php/php.log
c:
	cd /opt/youzan/scrm-api && nodemon -x "php bin/nova" -e "php html" -V
	cd /opt/youzan/scrm-web && nodemon -x "php bin/httpd" -e "php html" -V

dl:
	wget https://pecl.php.net/get/memcached-2.1.0.tgz -O $(ASSETS)memcached.tgz
	wget https://pecl.php.net/get/memcache-3.0.8.tgz -O $(ASSETS)memcache.tgz
	wget https://pecl.php.net/get/apcu-4.0.10.tgz -O $(ASSETS)apcu.tgz
	wget https://pecl.php.net/get/msgpack-0.5.6.tgz -O $(ASSETS)msgpack.tgz
	wget https://pecl.php.net/get/xdebug-2.3.3.tgz -O $(ASSETS)xdebug.tgz
	wget https://pecl.php.net/get/xhprof-0.9.4.tgz -O $(ASSETS)xhprof.tgz
	wget https://pecl.php.net/get/mongo-1.6.0.tgz -O $(ASSETS)mongo.tgz
	wget https://pecl.php.net/get/redis-2.2.7.tgz -O $(ASSETS)redis.tgz
	wget https://pecl.php.net/get/gearman-1.1.2.tgz -O $(ASSETS)gearman.tgz
	wget https://getcomposer.org/composer.phar -O $(ASSETS)composer.phar
	wget https://github.com/phalcon/cphalcon/archive/phalcon-v2.0.9.tar.gz -O $(ASSETS)cphalcon.tgz
	wget http://pecl.php.net/get/swoole-1.8.1.tgz -O $(ASSETS)swoole.tgz
