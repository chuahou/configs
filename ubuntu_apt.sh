#!/bin/bash
#
# Uses `apt` to install the common packages I will need on every new Ubuntu
# installation. I started working on this late, so it will be incomplete.
#
# Run as root.

# update package lists
apt update

# install build tools
apt install build-essential pkg-config cmake

# install tools
apt install vim git tmux gitg doxygen graphviz curl

# install libreoffice
apt install libreoffice

# install MS fonts
apt install ttf-mscorefonts-installer

# install touchpad indicator
add-apt-repository ppa:atareao/atareao
apt update
apt install touchpad-indicator

# TODO: Will add more things when I realise I need them

