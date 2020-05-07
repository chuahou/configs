#!/bin/bash
#
# Installs stack (Haskell).
#
# Do NOT run as ROOT.

# check not root
../scripts/check_root.sh user || exit 1

# install rust
curl -sSL https://get.haskellstack.org/ | sh
