#!/bin/bash

# start all the services

composer config -g repo.packagist composer https://packagist.phpcomposer.com
composer global require "phpunit/phpunit:4.*"
composer global require "mockery/mockery:~0.9.2"


#/usr/bin/supervisord -n
#supervisorctl start laravel-worker:*

exec "$@"
