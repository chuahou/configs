#!/bin/bash
#
# Installs nvm.
#
# Do NOT run as ROOT.

# check not root
$(dirname "$0")/check_root.sh user || exit 1

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.nvm/nvm.sh

# install node
nvm install node
