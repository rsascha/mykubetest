#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Parameter version is required!"
    exit 1
fi

VERSION=$1

echo "docker build --tag localhost:32000/mykubetest:$VERSION -f k8s.mykubetest.Dockerfile ."
docker build --tag localhost:32000/mykubetest:$VERSION -f k8s.mykubetest.Dockerfile .

echo "docker push localhost:32000/mykubetest:$VERSION"
docker push localhost:32000/mykubetest:$VERSION

echo "docker tag localhost:32000/mykubetest:$VERSION localhost:32000/mykubetest:latest"
docker tag localhost:32000/mykubetest:$VERSION localhost:32000/mykubetest:latest

echo "docker push localhost:32000/mykubetest:latest"
docker push localhost:32000/mykubetest:latest
