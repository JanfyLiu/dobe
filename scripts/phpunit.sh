#!/usr/bin/env bash

# beginning of "docker-machine env default" output
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/fly/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# End of "docker-machine env default" output


#docker run --rm --sig-proxy=true -v ${PWD}:${PWD} -w ${PWD} --pid=host dobe_php php "$@"

#docker exec -i dobe_php_1 phpunit "$@"

C= docker run -i --rm -v "${PWD}":"${PWD}" -v /tmp/:/tmp/ -w ${PWD} --net=host --sig-proxy=true --pid=host dobe_php php "$@"
echo ${C}
#docker run -i --rm -v "${PWD}":"${PWD}" -v ~/work:/opt -w ${PWD} --net=host --sig-proxy=true --pid=host dobe_php php "$@"
