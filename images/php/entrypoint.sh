#!/bin/bash

# start all the services

#/usr/bin/supervisord -n
#supervisorctl start laravel-worker:*

php youzan/scrm-api/bin/nova && php youzan/scrm-web/bin/httpd


exec "$@"
