#!/bin/bash
#
# Installs rust.
#
# Run as ROOT.

# check not root
../scripts/check_root.sh root || exit 1

# install Spotify
snap install spotify
