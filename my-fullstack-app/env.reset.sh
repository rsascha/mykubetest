#!/bin/bash

#
# Set everthing to initial state.
#
microk8s.reset
./env.setup.sh
./env.deploy.sh
