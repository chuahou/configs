#!/bin/bash
#
# Runs all initial Ubuntu setup that does not require sudo.
#
# DO NOT RUN AS ROOT

# check for root
if [ "$EUID" -eq 0 ]
then
    echo "Do not run as ROOT."
    exit
fi

# copy all configs from here
mkdir -p ~/.config/regolith
cp -r ./* ~/.config/regolith/
