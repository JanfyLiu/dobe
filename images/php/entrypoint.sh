#!/bin/bash

# start all the services

#/usr/bin/supervisord -n
#supervisorctl start laravel-worker:*

# php youzan/scrm-api/bin/nova >/var/log/nova.log && php youzan/scrm-web/bin/httpd >/var/log/httpd.log &
# php youzan/scrm-api/bin/nova
echo 'start services';

exec "$@"
