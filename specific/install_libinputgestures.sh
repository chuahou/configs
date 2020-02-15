#!/bin/bash
#
# Installs https://github.com/bulletmark/libinput-gestures.

# add self to input group
sudo gpasswd -a $USER input

# install prerequisites
sudo apt-get install libinput-tools xdotool wmctrl -y

# clone and install
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
cd ..
rm -rf libinput-gestures

