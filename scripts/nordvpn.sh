#!/bin/bash
#
# Installs NordVPN.
#
# Run as ROOT.

# check for root
$(dirname "$0")/check_root.sh root || exit 1

wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
dpkg -i nordvpn-release_1.0.0_all.deb
rm nordvpn-release_1.0.0_all.deb
