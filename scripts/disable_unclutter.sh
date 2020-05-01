#!/bin/bash
#
# Disables unclutter.
#
# Run as ROOT.

# check not root
./check_root.sh root || exit 1

TARGET=/etc/default/unclutter
if [ -e $TARGET ]; then
	mv $TARGET ${TARGET}.backup
fi
echo "" > $TARGET
