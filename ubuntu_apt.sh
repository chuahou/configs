#!/bin/bash
#
# Uses `apt` to install the common packages I will need on every new Ubuntu
# installation. I started working on this late, so it will be incomplete.
#
# Run as root.

# update package lists
apt update

# install tools
apt install git tmux gitg doxygen graphviz

# TODO: Will add more things when I realise I need them

