#!/bin/bash

docker build --tag localhost:32000/mykubetest:latest -f k8s.mykubetest.Dockerfile .
docker push localhost:32000/mykubetest:latest

microk8s.kubectl delete -f k8s.mykubetest.deployment.yaml
microk8s.kubectl apply -f k8s.mykubetest.deployment.yaml
