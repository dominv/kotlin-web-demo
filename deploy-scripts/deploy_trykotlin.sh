#!/usr/bin/env bash

# Pull latest version of published subtree
git checkout master
git subtree add --prefix .trykotlin https://github.com/dominv/kotlin-web-demo.git master --squash
git subtree pull --prefix .trykotlin --message="[skip ci] Update subtree" https://github.com/dominv/kotlin-web-demo.git master --squash

# Update arrow version
echo 0.7.3 > .trykotlin/arrowktversion
git add .trykotlin/arrowktversion
git commit -m "[skip ci] Upgrading arrow version"

# Push built subtree to trykotlinwebdemo
git subtree push --prefix .trykotlin https://github.com/dominv/kotlin-web-demo master master
