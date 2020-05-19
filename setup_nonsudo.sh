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
./telegram.sh
./ohmyzsh.sh
cd ..

# configure git
cd scripts
./git_config.sh

# get fonts
./wget_fonts.sh

# get dynamic-wallpaper
./dynamic_wallpaper.sh

# setup vscode
cd ..
cd editorconfigs
./vsextensions.sh install vsextensions.txt

# set touchpad to disable on external
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

# set mouse acceleration to flat
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
