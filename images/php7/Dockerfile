FROM php:7.0.2-fpm

# Install env
COPY ./assets/* /tmp/
RUN cp /tmp/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        git \
        g++ \
        wget \
        curl \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        libicu-dev \
        libmcrypt-dev \
        libmemcached-dev \
        libsqlite3-dev \
        libpq-dev \
        imagemagick \
        graphicsmagick \
        graphviz \
        && apt-get clean && rm -r /var/lib/apt/lists/*

# Install modules
RUN docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install zip \
        intl \
        gd \
        bcmath \
        iconv \
        opcache \
        tokenizer \
        mbstring \
        mcrypt \
        pdo \
        pdo_mysql \
        pdo_sqlite \
        pdo_pgsql

# Install PHP extensions (OR docker-php-pecl-install)
RUN pecl install /tmp/memcached.tgz \
        /tmp/memcache.tgz \
        /tmp/apcu.tgz \
        /tmp/msgpack.tgz \
        /tmp/xhprof.tgz \
        /tmp/xdebug.tgz \
        /tmp/mongo.tgz \
        /tmp/redis.tgz

# Install phalcon
RUN cd /home \
    && tar -xvf /tmp/cphalcon.tgz \
    && mv cphalcon-* phalcon \
    && cd phalcon/build && ./install

# Install Composer
RUN cp /tmp/composer.phar /usr/local/bin/composer \
    && chmod 755 /usr/local/bin/composer

# PHP Config
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./extension.ini /usr/local/etc/php/conf.d/extension.ini

# Write Permission
RUN usermod -u 1000 www-data

CMD ["php-fpm", "-F"]

WORKDIR /opt
EXPOSE 9000 9001
VOLUME ["/opt"]
