#!/usr/bin/env bash

git checkout master

git pull

sh gradlew war

sudo cp ./kotlin.web.demo.server/build/libs/WebDemoWar.war ./docker/frontend/war/WebDemoWar.war

sudo cp ./kotlin.web.demo.backend/build/libs/WebDemoBackend.war ./docker/backend/war/WebDemoBackend.war

sudo docker-compose down

sudo docker-compose build

sudo docker-compose up -d