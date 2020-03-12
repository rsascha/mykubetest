#!/bin/bash

#
# Init microk8s for this project.
#

echo "sudo microk8s.enable registry"
sudo microk8s.enable registry

echo "microk8s.kubectl apply -f k8s.secret.yaml"
microk8s.kubectl apply -f k8s.secret.yaml

echo "./env.deploy.sh"
./env.deploy.sh
