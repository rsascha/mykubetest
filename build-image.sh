#!/bin/bash

docker build . --tag localhost:32000/mynginx:latest
docker push localhost:32000/mynginx:latest