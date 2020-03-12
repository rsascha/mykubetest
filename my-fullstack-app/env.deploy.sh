#!/bin/bash

MAJOR=0
MINOR=0
BUILD=$(($(cat version.txt)+1))
echo $BUILD > version.txt

VERSION=$MAJOR.$MINOR.$BUILD

echo "./env.build.sh $VERSION"
./env.build.sh $VERSION

echo "./k8s.api.build-and-push.sh $VERSION"
./k8s.api.build-and-push.sh $VERSION

echo "./k8s.mykubetest.build-and-push.sh $VERSION"
./k8s.mykubetest.build-and-push.sh $VERSION

echo "./k8s.api.deploy.sh $VERSION"
./k8s.api.deploy.sh $VERSION

echo "./k8s.mykubetest.deploy.sh $VERSION"
./k8s.mykubetest.deploy.sh $VERSION
