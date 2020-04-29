#!/bin/bash
#
# Runs all initial Ubuntu setup that does not require sudo.
#
# Do NOT run as ROOT.

# check for root
scripts/check_root.sh user || exit 1

# misc installs
installscripts/rust.sh
installscripts/spotify.sh
installscripts/telegram.sh

# install dotfiles
./install_profiles.sh

# configure git
scripts/git_config.sh

# configure terminal
scripts/gnome_term_theme.sh

# get fonts
scritps/wget_fonts.sh

# set touchpad to disable on external
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

