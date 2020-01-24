#!/bin/bash
#
# Installs digisys stuff as per
# https://spivey.oriel.ox.ac.uk/corner/Installing_the_micro:bit_toolchain_
# (Digital_Systems)
#
# Run as root.

# check for root
if [ "$EUID" -ne 0 ]
then
    echo "Run as ROOT."
    exit
fi

# install packages
apt-get install -y gcc-arm-none-eabi libnewlib-arm-none-eabi srecord mercurial \
    minicom
pip3 install --pre -U pyocd

# enable access to microbit
echo \"ACTION==\"add\", SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0d28\", ATTRS{idProduct}==\"0204\", MODE=\"660\", GROUP=\"plugdev\"\" > \
    /etc/udev/rules.d/50-mbed.rules
usermod -a -G plugdev $USER # add current user to plugdev group

# remove modem manager
apt-get purge -y --auto-remove modemmanager
