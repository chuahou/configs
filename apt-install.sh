#!/bin/bash
#
# Uses `apt` to install the common packages I will need on every new Ubuntu
# installation. I started working on this late, so it will be incomplete.
#
# Run as ROOT.

# check for root
scripts/check_root.sh root || exit 1

# temporarily disable IPv6
sysctl net.ipv6.conf.all.disable_ipv6=1

# add PPAs
for script in apt-ppas/*.sh; do
	bash "$script" -H
done

# reenable IPv6
sysctl net.ipv6.conf.all.disable_ipv6=0

# update package lists
apt-get update

# upgrade first
apt-get upgrade -y

# install everything from apt-packages
xargs apt-get install -y < apt-packages
