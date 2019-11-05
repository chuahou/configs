#!/bin/bash
#
# Installs FreeCAD.
#
# Run as root.

# check for root
if [ "$EUID" -ne 0 ]
then
    echo "Run as ROOT."
    exit
fi

add-apt-repository ppa:freecad-maintainers/freecad-stable
apt update
apt install freecad
