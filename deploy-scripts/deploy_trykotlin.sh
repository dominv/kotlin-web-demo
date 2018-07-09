#!/usr/bin/env bash

# Add and pull latest version of trykotlin subtree
#git subtree add --prefix .trykotlin https://github.com/dominv/kotlin-web-demo.git master --squash
#git subtree split --prefix .trykotlin -b trykotlin
#git subtree pull --prefix .trykotlin --message="Update trykotlin subtree" https://github.com/dominv/kotlin-web-demo.git master --squash

git remote add trykotlin https://github.com/dominv/kotlin-web-demo.git
git fetch
git branch trykotlin_master trykotlin/master

git checkout -f trykotlin_master
git subtree split --squash --prefix arrowkt -b trykotlin_temp

# Update arrow version
echo $VERSION_NAME > arrowkt/arrowktversion
git add arrowkt/arrowktversion
git commit -m "Upgrading arrow version in trykolin"

# Push built subtree to trykotlinwebdemo
git push trykotlin_temp https://github.com/dominv/kotlin-web-demo.git master
rm -rf .trykotlin
git add .trykotlin/
git commit -m "Cleaning trykotlin"
git checkout master