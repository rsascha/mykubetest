#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Parameter version is required!"
    exit 1
fi

VERSION=$1

echo "docker build --tag localhost:32000/api:$VERSION -f k8s.api.Dockerfile ."
docker build --tag localhost:32000/api:$VERSION -f k8s.api.Dockerfile .

echo "docker push localhost:32000/api:$VERSION"
docker push localhost:32000/api:$VERSION
