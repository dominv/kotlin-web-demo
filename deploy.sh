#!/usr/bin/env bash

sudo apt update

sudo apt install docker

sudo service docker start

docker version

sudo pip install docker-compose

docker-compose version

sh ./gradlew ::copyKotlinLibs

sh ./gradlew war

mkdir ./docker/frontend/war/

mkdir ./docker/backend/war/

cp ./kotlin.web.demo.server/build/libs/WebDemoWar.war ./docker/frontend/war/WebDemoWar.war

cp ./kotlin.web.demo.backend/build/libs/WebDemoBackend.war ./docker/backend/war/WebDemoBackend.war

docker-compose build

docker-compose up
