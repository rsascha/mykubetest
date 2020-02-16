#!/bin/bash

MAJOR=0
MINOR=0
BUILD=5

VERSION=$MAJOR.$MINOR.$BUILD

npm version $VERSION

npm run build

docker build --tag localhost:32000/api:latest -f k8s.api.Dockerfile .
docker tag localhost:32000/api:latest localhost:32000/api:$VERSION
docker push localhost:32000/api:latest
docker push localhost:32000/api:$VERSION

echo sed -i 's/api:.*/api:'$VERSION'/g' k8s.api.deployment.yaml
sed -i 's/api:.*/api:'$VERSION'/g' k8s.api.deployment.yaml

echo microk8s.kubectl set image deployment/api-deployment api=api:$VERSION --record
microk8s.kubectl set image deployment/api-deployment api=api:$VERSION --record
