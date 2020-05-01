#!/bin/bash
#
# Runs all initial Ubuntu setup that requires sudo.
#
# Run as ROOT.

# check for root
scripts/check_root.sh root || exit 1

./apt-install.sh
cd installscripts
./fuckit.sh
./spotify.sh
./ttfmscorefonts.sh
apt purge xserver-xorg-input-synaptics -y
	# synaptics doesn't play nicely with disable touchpad on external mouse
