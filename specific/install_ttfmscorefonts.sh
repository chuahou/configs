#!/bin/bash
#
# Installs MS core fonts with automatic acceptance of EULA.
#
# RUN AS ROOT.

# check for root
if [ "$EUID" -ne 0 ]
then
    echo "Run as ROOT."
    exit
fi

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
apt-get install ttf-mscorefonts-installer
