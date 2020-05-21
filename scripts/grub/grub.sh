#!/bin/bash
#
# Copies grub to /etc/default/grub, grub.png to /usr/share/backgrounds
# and runs update-grub.
#
# Run as ROOT.

# check for root
../check_root.sh root || exit 1

# backup /etc/default/grub
if [ ! -e /etc/default/grub.backup ]; then
	cp /etc/default/grub /etc/default/grub.backup
fi

# copy files
cp grub /etc/default/grub
cp grub.png /usr/share/backgrounds/grub.png

# update grub
update-grub
