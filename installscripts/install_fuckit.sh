#!/bin/bash
#
# Installs https://github.com/nvbn/thefuck
#
# Run as ROOT.

# check for root
if [ "$EUID" -ne 0 ]
then
    echo "Run as ROOT."
    exit
fi

# install Python
apt install python3-dev python3-pip python3-setuptools

# install thefuck
pip3 install thefuck
