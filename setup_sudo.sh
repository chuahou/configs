#!/bin/bash
#
# Runs all initial Ubuntu setup that requires sudo.
#
# Run as ROOT.

# cd to script directory
cd $(dirname "$0")

# check for root
scripts/check_root.sh root || exit 1

# log files
readonly LOG_FILE="./setup_sudo.log"
readonly ERR_FILE="./setup_sudo.err"
touch $LOG_FILE
touch $ERR_FILE
exec 1> >(tee -a "$LOG_FILE")
exec 2> >(tee -a "$ERR_FILE")

apt/apt.sh
scripts/fuckit.sh
scripts/spotify.sh
scripts/ttfmscorefonts.sh
scripts/pip.sh
apt-get purge --auto-remove xserver-xorg-input-synaptics -y
	# synaptics doesn't play nicely with disable touchpad on external mouse
