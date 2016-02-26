FROM php:5.6-fpm

# Install env
COPY ./pkg/* /tmp/
RUN cp /tmp/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
      git \
      g++ \
      wget \
      curl \
      make \
      autoconf \
      lrzsz \
      vim \
      graphviz\
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
      libicu-dev \
      supervisor \
      && apt-get clean && rm -r /var/lib/apt/lists/*

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
      mbstring \
      mcrypt \
      pdo \
      pdo_mysql \
      pdo_sqlite \
      pdo_pgsql

# Install PHP extensions (OR docker-php-pecl-install)
RUN pecl install \
    /tmp/memcached.tgz \
    /tmp/memcache.tgz \
    /tmp/apcu.tgz \
    /tmp/msgpack.tgz \
    /tmp/xhprof.tgz \
    /tmp/xdebug.tgz \
    /tmp/mongo.tgz \
    /tmp/redis.tgz \
    /tmp/gearman.tgz \
    /tmp/swoole.tgz

RUN cd /home \
    && tar -xvf /tmp/cphalcon.tgz \
    && mv cphalcon-* phalcon \
    && cd phalcon/build && ./install

# PHP config
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./extension.ini /usr/local/etc/php/conf.d/extension.ini
COPY ./supervisord.conf /etc/supervisor/conf.d/

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

# Install Composer
RUN cp /tmp/composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer

# Write Permission
RUN usermod -u 1000 www-data

EXPOSE 9000 9001

WORKDIR /opt

VOLUME ["/opt"]

# ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
