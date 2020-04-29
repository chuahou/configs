#!/bin/bash
#
# Installs MS core fonts with automatic acceptance of EULA.
#
# Run as ROOT.

# check for root
../scripts/check_root.sh root || exit 1

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
apt-get install ttf-mscorefonts-installer
