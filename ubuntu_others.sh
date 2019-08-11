#!/bin/bash
#
# Installs other things not meant to be installed as root.
#
# DO NOT RUN AS ROOT.

# check for root
if [ "$EUID" -eq 0 ]
then
    echo "Do not run as ROOT."
    exit
fi

# install rust
curl https://sh.rustup.rs -sSf | sh
