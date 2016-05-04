FROM php:7.0.6-fpm

# Install env
COPY ./pkg/* /tmp/
RUN cp /tmp/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    git \
    wget \
    openssl \
    vim \
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
    --no-install-recommends \
    && apt-get clean && rm -r /var/lib/apt/lists/*

# Install PHP extensions (OR docker-php-ext-enable )
#RUN pecl install /tmp/memcached.tgz
RUN pecl install /tmp/memcache.tgz
RUN pecl install /tmp/msgpack.tgz
RUN pecl install /tmp/xdebug.tgz
RUN pecl install /tmp/apcu.tgz
RUN pecl install /tmp/swoole.tgz
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

# Install Composer
#RUN curl -sS https://getcomposer.org/installer | php && chmod 755 /usr/local/bin/composer
RUN cp /tmp/composer.phar /usr/local/bin/composer && chmod 755 /usr/local/bin/composer

# PHP Config
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./extension.ini /usr/local/etc/php/conf.d/extension.ini

# Write Permission
RUN usermod -u 1000 www-data

WORKDIR /opt

VOLUME ["/opt"]

EXPOSE 9000 9001
