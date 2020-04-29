#!/bin/bash
#
# Uses `apt` to install the common packages I will need on every new Ubuntu
# installation. I started working on this late, so it will be incomplete.
#
# Run as ROOT.

# check for root
scripts/check_root.sh root || exit 1

# add PPAs
for script in apt-ppas/*.sh; do
	bash "$script" -H
done

# update package lists
apt-get update

# upgrade first
apt-get upgrade -y

# install everything from apt-packages
xargs apt-get install -y < apt-packages
