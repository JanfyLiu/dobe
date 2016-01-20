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
RUN pecl install /tmp/memcached.tgz
RUN pecl install /tmp/memcache.tgz
RUN pecl install /tmp/apcu.tgz
RUN pecl install /tmp/msgpack.tgz
RUN pecl install /tmp/xhprof.tgz
RUN pecl install /tmp/xdebug.tgz
RUN pecl install /tmp/mongo.tgz
RUN pecl install /tmp/redis.tgz
RUN pecl install /tmp/gearman.tgz

RUN cd /home \
    && tar -xvf /tmp/cphalcon.tgz \
    && mv cphalcon-* phalcon \
    && cd phalcon/build && ./install

# PHP config
COPY ./extension.ini /usr/local/etc/php/conf.d/extension.ini
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf

# Install Composer
RUN cp /tmp/composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer

WORKDIR /opt

# Write Permission
RUN usermod -u 1000 www-data

EXPOSE 9000 9001
VOLUME ["/opt"]
