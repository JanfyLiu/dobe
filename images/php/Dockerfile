FROM php:5.6-fpm

# Install env
COPY ./pkg/* /tmp/

RUN cp /tmp/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
      git \
      wget \
      vim \
      sqlite3 \
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
      nodejs && \
      apt-get clean && rm -r /var/lib/apt/lists/*

# Install modules
RUN docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/  \
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
      pdo_pgsql \
      sockets

# Install PHP extensions
COPY ./ext/* /usr/local/lib/php/extensions/no-debug-non-zts-20131226/

# Install PHP extensions (OR docker-php-pecl-install)
#RUN pecl install /tmp/memcached.tgz
#RUN pecl install /tmp/memcache.tgz
#RUN pecl install /tmp/apcu.tgz
#RUN pecl install /tmp/msgpack.tgz
#RUN pecl install /tmp/xhprof.tgz
#RUN pecl install /tmp/xdebug.tgz
#RUN pecl install /tmp/mongo.tgz
#RUN pecl install /tmp/redis.tgz
#RUN pecl install /tmp/gearman.tgz
#RUN pecl install /tmp/swoole.tgz
RUN pecl install /tmp/yaf.tgz

#RUN cd /home && tar -xvf /tmp/cphalcon.tgz && mv cphalcon-* phalcon && cd phalcon/build && ./install
#RUN cd /home && tar -xvf /tmp/node.tgz && mv node-* node && cd /usr/local/bin && ln -s /home/node/bin/* .
#RUN cd /home && git clone https://github.com/kjdev/php-ext-lz4.git && cd ./php-ext-lz4 && phpize && ./configure && make && make install
#RUN cd /home && git clone https://github.com/aerospike/aerospike-client-php.git && cd aerospike-client-php/src/aerospike && ./build.sh && make install


# PHP config
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./extension.ini /usr/local/etc/php/conf.d/extension.ini
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

# Install Composer
RUN cp /tmp/composer.phar /usr/local/bin/composer && chmod 755 /usr/local/bin/composer


# Write Permission
RUN usermod -u 1000 www-data

#ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

WORKDIR /opt

VOLUME ["/opt"]

EXPOSE 9000 9001
