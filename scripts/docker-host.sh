#!/usr/bin/env bash

update-docker-host() {
	# clear existing docker.local entry from /etc/hosts
	sudo sed -i '' '/[[:space:]]docker\.local$/d' /etc/hosts

	# get ip of running machine
	export DOCKER_IP="$(echo ${DOCKER_HOST} | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"

	# update /etc/hosts with docker machine ip
	[[ -n $DOCKER_IP ]] && sudo /bin/bash -c "echo \"${DOCKER_IP}	docker.local\" >> /etc/hosts"
}
