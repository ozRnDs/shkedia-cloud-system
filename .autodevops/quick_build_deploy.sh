#!/bin/bash

#USAGE Example bash .autodevops/quick_build_deploy.sh dev auth

export ENVIRONMENT=$1
export STATIC=$2

echo Start CD process to $ENVIRONMENT environment
source .autodevops/SERVICE_VERSIONS.properties
source .local/important_variables.properties

if [ "$STATIC" == "MOVE" ]; then
    echo Copy static
    sudo cp -r $SOURCE_LOCATION $TARGET_LOCATION
fi

echo Start Containers
docker compose up -d