#!/usr/bin/env bash

# git remote add trykotlin https://github.com/dominv/kotlin-web-demo
git fetch trykotlin
git checkout trykotlin/master -- arrowktversion

cat arrowktversion
echo 0.7.3 > arrowktversion
git commit -m "Upgraded arrow version in trykotlin"
git push
