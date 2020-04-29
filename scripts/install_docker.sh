#!/bin/bash
#
# Installs Docker desktop.
#
# Run as ROOT.

# check for root
./check_root.sh root || exit 1

# remove old versions
apt remove docker docker-engine docker.io containerd runc

# update apt
apt update

# install packages to allow apt to use HTTPS repository
apt install apt-transport-https ca-certificates curl gnupg-agent \
    software-properties-common

# add docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88

# add repo
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable"
apt update

# install docker
apt install docker-ce docker-ce-cli containerd.io

# run hello world
docker run hello-world

