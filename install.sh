#!/bin/bash

# install python3 and pip3
sudo apt install python3 python3-pip curl wget jq

# install some pip3 modules
pip3 install docker-compose

# install localstack
pip3 install "localstack[full]"

# start localstack locally
localstack start --host
