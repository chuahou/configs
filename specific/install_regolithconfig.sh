#!/bin/bash
#
# Installs Regolith config files.
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
cp -r regolith/* ~/.config/regolith/
