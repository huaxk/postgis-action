#!/bin/sh

docker_run="docker run"
docker_run="$docker_run -e POSTGRES_DB=$INPUT_POSTGRESQL_DB"
docker_run="$docker_run -e POSTGRES_USER=$INPUT_POSTGRESQL_USER"
docker_run="$docker_run -e POSTGRES_PASSWORD=$INPUT_POSTGRESQL_POSTGRES_PASSWORD"
docker_run="$docker_run -d -p $INPUT_POSTGRESQL_PORT:5432 mdillon/postgis:$INPUT_POSTGRESQL_VERSION"

sh -c "$docker_run"
