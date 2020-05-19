#!/bin/bash
#
# Installs Oh My Zsh
#
# Do NOT run as ROOT.

# check not root
../scripts/check_root.sh user || exit 1

# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
