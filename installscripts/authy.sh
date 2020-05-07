#!/bin/bash
#
# Installs authy.
#
# Run as ROOT.

# check root
../scripts/check_root.sh root || exit 1

# install Spotify
snap install authy --beta
