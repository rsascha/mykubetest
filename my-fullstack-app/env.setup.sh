#!/bin/bash

#
# Init microk8s for this project.
#

echo "sudo microk8s.enable registry"
sudo microk8s.enable registry

echo "microk8s.kubectl apply -f k8s.namespaces.yaml"
microk8s.kubectl apply -f k8s.namespaces.yaml

#echo "microk8s.kubectl config set-context mycontext --namespace=myspace"
#microk8s.kubectl config set-context mycontext --namespace=myspace

#echo "microk8s.kubectl config use-context mycontext"
#microk8s.kubectl config use-context mycontext

echo "microk8s.kubectl apply -f k8s.serviceaccounts.yaml"
microk8s.kubectl apply -f k8s.serviceaccounts.yaml

echo "microk8s.kubectl apply -f k8s.secrets.yaml"
microk8s.kubectl apply -f k8s.secrets.yaml

echo "microk8s.kubectl apply -f k8s.api.service.yaml"
microk8s.kubectl apply -f k8s.api.service.yaml

echo "microk8s.kubectl apply -f k8s.mykubetest.service.yaml"
microk8s.kubectl apply -f k8s.mykubetest.service.yaml
