#!/bin/bash
#
# Installs https://github.com/nvbn/thefuck
#
# Run as ROOT.

# check for root
./check_root.sh root || exit 1

# install Python
apt install python3-dev python3-pip python3-setuptools

# install thefuck
pip3 install thefuck
