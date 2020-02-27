#!/bin/bash

# install python3 and pip3
sudo apt install python3 python3-pip -y

# install localstack
pip3 install localstack

# start localstack
localstack start
