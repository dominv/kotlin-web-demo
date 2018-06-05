#!/usr/bin/env bash

sudo apt-get update

sudo service mysql stop

sudo apt-get install -f openjdk-8-jdk

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose version

sh gradlew

sh gradlew ::copyKotlinLibs

sh gradlew war

mkdir ./docker/frontend/war/

mkdir ./docker/backend/war/

sudo cp ./kotlin.web.demo.server/build/libs/WebDemoWar.war ./docker/frontend/war/WebDemoWar.war

sudo cp ./kotlin.web.demo.backend/build/libs/WebDemoBackend.war ./docker/backend/war/WebDemoBackend.war

sudo docker-compose build

sudo docker-compose up
