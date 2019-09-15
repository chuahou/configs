#!/bin/bash
#
# Installs Heroku CLI.
#
# Run as root.

# check for root
if [ "$EUID" -ne 0 ]
then
    echo "Run as ROOT."
    exit
fi

snap install --classic heroku
