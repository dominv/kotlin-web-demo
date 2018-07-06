#!/usr/bin/env bash

git remote add trykotlin https://github.com/dominv/kotlin-web-demo
git fetch trykotlin
git checkout -b trykotlin-update-arrow-version trykotlin/master
git checkout master
git read-tree --prefix=trykotlin -u trykotlin-update-arrow-version
git checkout trykotlin-update-arrow-version
git pull
git checkout master
git merge --squash -s subtree --no-commit trykotlin-update-arrow-version
