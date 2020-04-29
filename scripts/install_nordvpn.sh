#!/bin/bash
#
# Installs NordVPN.
#
# Run as ROOT.

# check for root
if [ "$EUID" -ne 0 ]
then
    echo "Run as ROOT."
    exit
fi

wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
dpkg -i nordvpn-release_1.0.0_all.deb
apt update
apt install nordvpn -y
rm nordvpn-release_1.0.0_all.deb

