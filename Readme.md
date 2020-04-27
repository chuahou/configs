# Common config files

[![forthebadge](https://forthebadge.com/images/badges/no-ragrets.svg)](https://forthebadge.com)

A host of a variety of config files for Ubuntu that make it easy to make
configurations uniform and fast to setup.

- `profiles`: dotfiles that can be installed via `install_profiles.sh`
- `specific`: a list of scripts to install specific configurations that may be
	specialised or not desired by default in a new installation
- `editorconfigs`: config files for editors with their specific scripts
- `checkgit.sh`: a utility script that checks all sibling directories to ensure
	changes have been pushed to remote
- `setup_nonsudo.sh` and `setup_sudo.sh`: 2 scripts to quickly setup a new
	installation, the former to be run as user and the latter to be run as root
- `ubuntu_apt.sh`: installation of required apt packages

## New installation

	$ sudo ./setup_sudo.sh
	$ ./setup_nonsudo.sh
