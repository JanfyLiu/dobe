FROM php:5.6-fpm

ENV NODE_VERSION=5.9.1

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
      sqlite3 \
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
      npm && \
      apt-get clean && rm -r /var/lib/apt/lists/*

# Install modules
RUN docker-php-ext-configure gd \
      --with-freetype-dir=/usr/include/ \
      --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install \
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

# Install Composer
RUN cp /tmp/composer.phar /usr/local/bin/composer

# Install phalcon
RUN cd /home && \
    tar -xvf /tmp/cphalcon.tgz && \
    mv cphalcon-* phalcon && \
    cd phalcon/build && ./install

# Install node
RUN cd /home && \
  tar -xvf /tmp/node.tgz && \
  mv node-* node && \
  cd /usr/local/bin && \
  ln -s /home/node/bin/* .

# RUN npm install -g nodemon cnpm gulp bower && npm cache clear

# PHP config
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./extension.ini /usr/local/etc/php/conf.d/extension.ini
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./entrypoint.sh /entrypoint.sh

# Write Permission
RUN usermod -u 1000 www-data
RUN chmod 777 /usr/local/bin/composer /entrypoint.sh

#ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

WORKDIR /opt

VOLUME ["/opt"]

EXPOSE 9000 9001 8080
