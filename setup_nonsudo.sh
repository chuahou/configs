#!/bin/bash
#
# Runs all initial Ubuntu setup that does not require sudo.
#
# Do NOT run as ROOT.

# cd to script directory
cd $(dirname "$0")

# check for root
scripts/check_root.sh user || exit 1

# log files
readonly LOG_FILE="./setup_nonsudo.log"
readonly ERR_FILE="./setup_nonsudo.err"
touch $LOG_FILE
touch $ERR_FILE
exec 1> >(tee -a "$LOG_FILE")
exec 2> >(tee -a "$ERR_FILE")

scripts/rust.sh
scripts/telegram.sh
scripts/nvm.sh
scripts/iosevka.sh
scripts/ohmyzsh.sh

cd dotfiles && ./install.sh
