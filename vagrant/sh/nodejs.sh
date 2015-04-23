#!/bin/bash

# Modified from https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs
sudo npm install npm -g

# Check if installed by running:
#  $ node -v
# and
#  $ npm -v