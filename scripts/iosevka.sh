#!/bin/bash
#
# Grabs Iosevka Fixed 3.0.0 from GitHub.
#
# Do NOT run as ROOT.

# check not root
$(dirname "$0")/check_root.sh user || exit 1

wget https://github.com/be5invis/Iosevka/releases/download/v3.0.0/ttf-iosevka-fixed-3.0.0.zip
unzip ttf-iosevka-fixed-3.0.0.zip -d tmp
mkdir -p ~/.fonts
cp tmp/ttf/*.ttf ~/.fonts
rm -rf tmp
rm ttf-iosevka-fixed-3.0.0.zip
