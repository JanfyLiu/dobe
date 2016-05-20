FROM php:7.0.6-fpm

# Install env
COPY ./pkg/* /tmp/
RUN cp /tmp/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    git \
    wget \
    openssl \
    vim \
    curl \
    libcurl4-openssl-dev \
    graphviz\
    imagemagick \
    graphicsmagick \
    libc6-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libicu-dev \
    libmcrypt-dev \
    libmemcached-dev \
    libpq-dev \
    supervisor \
    --no-install-recommends \
    && apt-get clean && rm -r /var/lib/apt/lists/*

# Install PHP extensions
COPY ./ext/* /usr/local/lib/php/extensions/no-debug-non-zts-20151012/

# Install PHP extensions (OR docker-php-ext-enable )
#RUN pecl install /tmp/memcached.tgz
RUN pecl install /tmp/memcache.tgz
RUN pecl install /tmp/msgpack.tgz
RUN pecl install /tmp/xdebug.tgz
RUN pecl install /tmp/apcu.tgz
#RUN pecl install /tmp/swoole.tgz
#RUN pecl install /tmp/redis.tgz
#RUN pecl install /tmp/mongo.tgz
#RUN pecl install /tmp/xhprof.tgz

# Install modules
RUN docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install \
        gd \
        zip \
        intl \
        pcntl \
        bcmath \
        iconv \
        opcache \
        tokenizer \
        mcrypt \
        pdo \
        pdo_mysql \
        pdo_pgsql \
        sockets

RUN cd /home && git clone https://github.com/kjdev/php-ext-lz4.git && cd ./php-ext-lz4 && phpize && ./configure && make && make install
#RUN cd /home && git clone https://github.com/aerospike/aerospike-client-php.git && cd aerospike-client-php/src/aerospike && ./build.sh && make install
#RUN cd /home && git clone http://git.qima-inc.com/platform/yz-swoole.git && cd yz-swoole && phpize && ./configure && make && make install

# Install Composer
#RUN curl -sS https://getcomposer.org/installer | php && chmod 755 /usr/local/bin/composer
RUN cp /tmp/composer.phar /usr/local/bin/composer && chmod 755 /usr/local/bin/composer

# PHP Config
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./extension.ini /usr/local/etc/php/conf.d/extension.ini
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

# Write Permission
RUN usermod -u 1000 www-data

#ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /opt

VOLUME ["/opt"]

EXPOSE 9000 9001 8000
