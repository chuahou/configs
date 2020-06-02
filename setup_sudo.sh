#!/bin/bash
#
# Runs all initial Ubuntu setup that requires sudo.
#
# Run as ROOT.

# check for root
scripts/check_root.sh root || exit 1

# log files
readonly LOG_FILE="./setup_sudo.log"
readonly ERR_FILE="./setup_sudo.err"
touch $LOG_FILE
touch $ERR_FILE
exec 1> >(tee -a "$LOG_FILE")
exec 2> >(tee -a "$ERR_FILE")

./apt-install.sh
cd installscripts
./fuckit.sh
./spotify.sh
./ttfmscorefonts.sh
./authy.sh
./pip.sh
apt purge xserver-xorg-input-synaptics -y
	# synaptics doesn't play nicely with disable touchpad on external mouse
cd ../scripts
./disable_unclutter.sh
