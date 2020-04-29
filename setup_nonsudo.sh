#!/bin/bash
#
# Runs all initial Ubuntu setup that does not require sudo.
#
# Do NOT run as ROOT.

# check for root
scripts/check_root.sh user || exit 1

# install dotfiles
./install_profiles.sh

# run specific scripts
specific/install_regolithconfig.sh
specific/git_config.sh
specific/wget_fonts.sh
specific/install_telegram.sh
specific/s3r0-modified.sh

# install spotify
snap install spotify

# set touchpad to disable on external
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

