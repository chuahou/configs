#!/bin/bash
#
# Installs Heroku CLI.
#
# Run as ROOT.

# check for root
./check_root.sh root || exit 1

snap install --classic heroku
