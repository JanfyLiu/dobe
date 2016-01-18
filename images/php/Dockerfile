FROM php:5.6-fpm

# Install env
COPY ./pkg/* /tmp/
RUN cp /tmp/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        git \
        g++ \
        wget \
        curl \
        imagemagick \
		graphicsmagick \
        libgearman-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpq-dev \
        libsqlite3-dev \
        libpng12-dev \
        && apt-get clean && rm -r /var/lib/apt/lists/*

# Install modules
RUN docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install zip \
        bcmath \
        gd \
        mbstring \
        mcrypt \
        mysql \
        mysqli \
        pdo_mysql \
        pdo_pgsql

# Install PHP extensions (OR docker-php-pecl-install)
RUN pecl install /tmp/memcached.tgz \
    && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini
RUN pecl install /tmp/memcache.tgz \
    && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/memcache.ini
RUN pecl install /tmp/apcu.tgz \
    && echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apcu.ini
RUN pecl install /tmp/msgpack.tgz \
    && echo "extension=msgpack.so" > /usr/local/etc/php/conf.d/msgpack.ini
RUN pecl install /tmp/xhprof.tgz \
    && echo "extension=xhprof.so" > /usr/local/etc/php/conf.d/xhprof.ini
RUN pecl install /tmp/xdebug.tgz \
    && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini
RUN pecl install /tmp/mongo.tgz \
    && echo "extension=mongo.so" > /usr/local/etc/php/conf.d/mongo.ini
RUN pecl install /tmp/redis.tgz \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
RUN pecl install /tmp/gearman.tgz \
    && echo "extension=gearman.so" > /usr/local/etc/php/conf.d/gearman.ini

RUN cd /home \
    && tar -xvf /tmp/cphalcon.tgz \
    && mv cphalcon-* phalcon \
    && cd phalcon/build && ./install \
    && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini

# PHP config
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf

# Install Composer
RUN cp /tmp/composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer

WORKDIR /opt

# Write Permission
RUN usermod -u 1000 www-data

EXPOSE 9000
VOLUME ["/opt"]
