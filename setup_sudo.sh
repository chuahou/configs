#!/bin/bash
#
# Runs all initial Ubuntu setup that requires sudo.
#
# Run as ROOT.

# check for root
./check_root.sh root || exit 1

./apt-install.sh
installscripts/fuckit.sh
