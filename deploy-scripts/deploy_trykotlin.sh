#!/usr/bin/env bash

git remote add trykotlin https://github.com/dominv/kotlin-web-demo
git fetch trykotlin
git checkout trykotlin-update-arrow-version trykotlin/master -- arrow/arrowktversion

# git checkout master
# git read-tree --prefix=trykotlin/arrow -u trykotlin-update-arrow-version
cat arrowktversion
# git commit -m "Merged library project as subdirectory"
# git push