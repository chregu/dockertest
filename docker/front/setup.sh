#!/bin/bash

# Replace envvars in varnish configuration files
envs=`cat /etc/container_environment.sh`

for env in $envs
do
    IFS== read name value <<< "$env"

    sed -i "s|\${${name}}|${value}|g" /etc/nginx/sites-enabled/default
done
