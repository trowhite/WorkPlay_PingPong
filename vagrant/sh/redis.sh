#!/bin/bash

add-apt-repository -y ppa:chris-lea/redis-server
apt-get update
apt-get install -y redis-server

# Check if installed by running:
#  $ redis-server --version