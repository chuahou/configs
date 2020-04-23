#!/bin/bash
#
# Runs all initial Ubuntu setup that requires sudo.
#
# Run as root.

# check for root
if [ "$EUID" -ne 0 ]
then
    echo "Run as ROOT."
    exit
fi

apt install regolith-desktop
apt install dunst
