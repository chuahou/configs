#!/usr/bin/env bash
#
# Installs InstantRST.
# https://github.com/gu-fan/InstantRst
#
# Run as ROOT.

# check not root
../scripts/check_root.sh root || exit 1

# install rust
pip3 install https://github.com/Rykka/instant-rst.py/archive/master.zip
