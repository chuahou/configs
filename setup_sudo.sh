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

# apt
./ubuntu_apt.sh

# specific scripts
specific/install_fuckit.sh
specific/install_nordvpn.sh

