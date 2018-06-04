#!/usr/bin/env bash

AWSINSTANCE=$1

sh ./gradlew ::copyKotlinLibs

sh ./gradlew war

mkdir ./docker/frontend/war/

mkdir ./docker/backend/war/

cp ./kotlin.web.demo.server/build/libs/WebDemoWar.war ./docker/frontend/war/WebDemoWar.war

cp ./kotlin.web.demo.backend/build/libs/WebDemoBackend.war ./docker/backend/war/WebDemoBackend.war

docker-machine env $AWSINSTANCE

eval $(docker-machine env $AWSINSTANCE)

docker-compose build

docker-compose up
