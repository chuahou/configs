#!/usr/bin/env bash
#
# Run as ROOT.

# get to this directory
cd $(realpath $(dirname $0))

# check for root
../scripts/check_root.sh root || exit 1

# temporarily disable IPv6
sysctl net.ipv6.conf.all.disable_ipv6=1

# add PPAs
while read ppa; do
	add-apt-repository ppa:$ppa -y
done < ppa.list

# reenable IPv6
sysctl net.ipv6.conf.all.disable_ipv6=0

# update package lists
apt-get update

# upgrade first
apt-get upgrade -y

# install everything from apt-packages
xargs apt-get install -y < packages.list
