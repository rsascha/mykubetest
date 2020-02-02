#!/bin/bash

docker build --tag localhost:32000/api:latest -f k8s.api.Dockerfile .
docker push localhost:32000/api:latest
