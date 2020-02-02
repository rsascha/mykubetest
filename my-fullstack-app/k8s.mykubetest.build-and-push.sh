#!/bin/bash

docker build --tag localhost:32000/mykubetest:latest -f k8s.mykubetest.Dockerfile .
docker push localhost:32000/mykubetest:latest
