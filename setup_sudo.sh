#!/bin/bash
#
# Runs all initial Ubuntu setup that requires sudo.
#
# Run as ROOT.

# check for root
./check_root.sh root || exit 1

# apt
./ubuntu_apt.sh

# specific scripts
specific/install_fuckit.sh
specific/install_nordvpn.sh
