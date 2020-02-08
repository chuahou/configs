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
specific/git_config.sh
specific/wget_fonts.sh
specific/install_telegram.sh

