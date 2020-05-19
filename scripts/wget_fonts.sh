#!/bin/bash
#
# Downloads the inconsolata font from the Google Fonts repo on GitHub.
#
# Do NOT run as ROOT.

# check not root
./check_root.sh user || exit 1

# get files
wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf
wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Regular.ttf
wget https://github.com/google/fonts/raw/master/ofl/prata/Prata-Regular.ttf

# install in ~/.fonts
mkdir -p ~/.fonts
mv *.ttf ~/.fonts
mv *.otf ~/.fonts

# install Victor Mono
wget https://github.com/be5invis/Iosevka/releases/download/v3.0.0/ttf-iosevka-fixed-3.0.0.zip
unzip ttf-iosevka-fixed-3.0.0.zip -d tmp
cp tmp/ttf/*.ttf ~/.fonts
rm -rf tmp
rm ttf-iosevka-fixed-3.0.0.zip
