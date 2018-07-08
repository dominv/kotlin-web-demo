#!/usr/bin/env bash
. $(dirname $0)/deploy_common.sh

echo "Branch '$TRAVIS_BRANCH'"

if [ "$TRAVIS_BRANCH" == "master" ]; then
    if [[ "$VERSION_NAME" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Starting script for Release $VERSION_NAME"
        . $(dirname $0)/deploy_release.sh
        echo "Starting script for TryKotlin deployment with Release $VERSION_NAME"
        . $(dirname $0)/deploy_trykotlin.sh
    elif [[ "$VERSION_NAME" == *-SNAPSHOT ]]; then
        echo "Starting script for Snapshot Release $VERSION_NAME"
        . $(dirname $0)/deploy_snapshot.sh
    else
        echo "No deploy script matched version '$VERSION_NAME' on master"
    fi
else
    echo "Skipped deployment in branch '$TRAVIS_BRANCH'"
fi
