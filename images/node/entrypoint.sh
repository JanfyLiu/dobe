#!/bin/bash

# Install
npm install -g nodemon cnpm gulp bower eslint eslint-plugin-react --registry=https://registry.npm.taobao.org && npm cache clear

# start all the services
cd /opt/inc/res && npm install
cd /opt/inc/res && ./server.sh

exec "$@"
