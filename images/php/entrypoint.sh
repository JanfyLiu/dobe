#!/bin/bash

# start all the services
echo 'start all the services';

#
/usr/bin/supervisord -n
#
supervisorctl start laravel-worker:*
