#!/bin/bash
#
# Runs all initial Ubuntu setup that does not require sudo.
#
# Do NOT run as ROOT.

# check for root
scripts/check_root.sh user || exit 1

# misc installs
cd installscripts
./rust.sh
./spotify.sh
./telegram.sh
cd ..

# configure git
cd scripts
./git_config.sh

# configure terminal
./gnome_term_theme.sh

# get fonts
./wget_fonts.sh

# make folder for vim
mkdir -p ~/.vim/backup

# setup vscode
cd ..
cd editorconfigs
make install
cd ..

# set touchpad to disable on external
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

# set mouse acceleration to flat
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'

