#!/bin/bash

sudo add-apt-repository -y ppa:chris-lea/redis-server
sudo apt-get update
sudo apt-get install -y redis-server

# Check if installed by running:
#  $ redis-server --version