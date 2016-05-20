FROM php:5.6-fpm

# Install env
COPY ./pkg/* /tmp/

RUN cp /tmp/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
      git \
      wget \
      vim \
      sqlite3 \
      curl \
      libcurl4-openssl-dev \
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
      libmysqld-dev \
      php5-dev \
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
      mysqli \
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
RUN pecl install yaf

#RUN cd /home && tar -xvf /tmp/cphalcon.tgz && mv cphalcon-* phalcon && cd phalcon/build && ./install
#RUN cd /home && tar -xvf /tmp/node.tgz && mv node-* node && cd /usr/local/bin && ln -s /home/node/bin/* .
#RUN cd /home && git clone https://github.com/kjdev/php-ext-lz4.git && cd ./php-ext-lz4 && phpize && ./configure && make && make install
#RUN cd /home && git clone https://github.com/aerospike/aerospike-client-php.git && cd aerospike-client-php/src/aerospike && ./build.sh && make install
RUN cd /home && git clone http://git.qima-inc.com/platform/yz-swoole.git \
    && cd yz-swoole/swoole-extension && phpize \
    && ./configure --enable-async-mysql=/usr/include/mysql --enable-async-httpclient --enable-aerospike --enable-sockets=/usr/local/include/php/ext/sockets/ \
    && make && make install


# PHP config
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./extension.ini /usr/local/etc/php/conf.d/extension.ini
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Install Composer
RUN cp /tmp/composer.phar /usr/local/bin/composer && chmod 755 /usr/local/bin/composer


# Write Permission
RUN usermod -u 1000 www-data

ENTRYPOINT ["/entrypoint.sh"]

CMD ["echo","CMD"]

WORKDIR /opt

VOLUME ["/opt"]

EXPOSE 9000 9001 8000
