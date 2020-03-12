#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Parameter version is required!"
    exit 1
fi

VERSION=$1

echo "sed -i 's/mykubetest:.*/mykubetest:'$VERSION'/g' k8s.mykubetest.deployment.yaml"
sed -i 's/mykubetest:.*/mykubetest:'$VERSION'/g' k8s.mykubetest.deployment.yaml

echo "microk8s.kubectl set image deployment/mykubetest mykubetest=mykubetest:$VERSION --record"
microk8s.kubectl set image deployment/mykubetest mykubetest=mykubetest:$VERSION --record

if [ $? -ne 0 ]; then
    echo "microk8s.kubectl apply -f k8s.mykubetest.deployment.yaml"
    microk8s.kubectl apply -f k8s.mykubetest.deployment.yaml
fi
