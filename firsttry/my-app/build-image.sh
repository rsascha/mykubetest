#!/bin/bash

docker build --tag localhost:32000/myapp:latest .
docker push localhost:32000/myapp:latest
