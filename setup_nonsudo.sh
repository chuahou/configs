#!/bin/bash
#
# Runs all initial Ubuntu setup that does not require sudo.
#
# DO NOT RUN AS ROOT

# check for root
if [ "$EUID" -eq 0 ]
then
    echo "Do not run as ROOT."
    exit
fi

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

