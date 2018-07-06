#!/usr/bin/env bash

# Add and pull latest version of trykotlin subtree
git checkout master
git subtree add --prefix .trykotlin https://github.com/dominv/kotlin-web-demo.git master --squash
git subtree pull --prefix .trykotlin --message="Update trykotlin subtree" https://github.com/dominv/kotlin-web-demo.git master --squash

# Update arrow version
echo arrowKtVersion=0.7.5 >> .trykotlin/versions/1.0.7/gradle.properties
echo arrowKtVersion=0.7.5 >> .trykotlin/versions/1.1.60/gradle.properties
echo arrowKtVersion=0.7.5 >> .trykotlin/versions/1.2.31/gradle.properties
git add .trykotlin/versions/1.0.7/gradle.properties
git add .trykotlin/versions/1.1.60/gradle.properties
git add .trykotlin/versions/1.2.31/gradle.properties
git commit -m "Upgrading arrow version in trykolin"

# Push built subtree to trykotlinwebdemo
git subtree push --prefix .trykotlin https://github.com/dominv/kotlin-web-demo.git master
rm -rf .trykotlin
git add .trykotlin/
git commit -m "Cleaning trykotlin"
