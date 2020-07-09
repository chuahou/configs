#!/usr/bin/env bash
#
# Installs xsession .desktop file to /usr/share/xsessions to run a standard
# .xinitrc session.
#
# Do NOT run as ROOT, sudo will be called appropriately.

# check for root
$(dirname "$0")/check_root.sh user || exit 1

# temporary file
TEMP_FILE="$0.temp"

# create desktop entry
echo "[Desktop Entry]" > TEMP_FILE
echo "Name=Custom .xinitrc for $USER" >> TEMP_FILE
echo "Exec=$HOME/.xinitrc" >> TEMP_FILE
echo "Type=Application" >> TEMP_FILE
echo "DesktopNames=Custom .xinitrc for $USER" >> TEMP_FILE

# move temporary file into place
sudo chown root:root TEMP_FILE
sudo mv TEMP_FILE /usr/share/xsessions/$USER.desktop
