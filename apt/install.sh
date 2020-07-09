#!/usr/bin/env bash
#
# Uses `apt` to install the common packages I will need on every new Ubuntu
# installation. I started working on this late, so it will be incomplete.
#
# Run as ROOT.

# get to this directory
cd $(realpath $(dirname $0))

# check for root
../scripts/check_root.sh root || exit 1

# add PPAs, disabling IPv6 (some issues were present with IPv6)
sysctl net.ipv6.conf.all.disable_ipv6=1
while read ppa; do
	add-apt-repository ppa:$ppa -y
done < ppa.list
sysctl net.ipv6.conf.all.disable_ipv6=0

# update package lists and upgrade
apt-get update
apt-get upgrade -y

# install everything from apt-packages
xargs apt-get install -y < packages.list
