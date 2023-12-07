#!/bin/bash

#USAGE Example bash .autodevops/quick_build_deploy.sh dev auth

export ENVIRONMENT=$1

echo Start CD process to $ENVIRONMENT environment
source .autodevops/SERVICE_VERSIONS.properties
source .local/important_variables.properties

docker compose up -d