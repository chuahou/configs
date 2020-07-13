#!/usr/bin/env bash
#
# Installs additional Haskell tools.
#
# Do NOT run as ROOT.

set -e

# check not root
$(dirname "$0")/check_root.sh user || exit 1

# installs prerequisites using apt
sudo apt-get install libicu-dev libncurses-dev libgmp-dev zlib1g-dev

# installs stack
curl -sSL https://get.haskellstack.org/ | sh

# clones hls and installs it
git clone https://github.com/haskell/haskell-language-server
cd haskell-language-server
stack ./install.hs hls-$(ghc --version | rev | cut -d ' ' -f 1 | rev) -j4
stack ./install.hs data
cd .. && rm haskell-language-server -rf

# installs hlint
stack install hlint -j4

# installs ghcid
stack install ghcid -j4
