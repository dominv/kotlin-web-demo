#!/usr/bin/env bash

# Configure trykotlin git user

0.7.

git config --global user.name $USER_NAME
git config --global user.email $USER_EMAIL

# Pull latest version of published subtree
git checkout master
git subtree pull --prefix=trykotlin --message="[skip ci] Update subtree" https://dominv:$GITHUB_API_KEY@github.com/dominv/kotlin-web-demo.git master



# Push built subtree to trykotlin website
#git subtree push --prefix=docs https://dominv:$GITHUB_API_KEY@github.com/dominv/kotlin-web-demo.git master


#VERSION_NAME=$(getProperty "VERSION_NAME")