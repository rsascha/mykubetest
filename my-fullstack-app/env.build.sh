#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Parameter version is required!"
    exit 1
fi

VERSION=$1

echo "npm version $VERSION"
npm version $VERSION

echo "#npm install"
#npm install

echo "#npm run build"
#npm run build
