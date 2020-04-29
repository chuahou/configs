# Common config files

[![forthebadge](https://forthebadge.com/images/badges/no-ragrets.svg)](https://forthebadge.com)

A utility repository I use for quick setup on Ubuntu systems.
Dotfiles are located at [chuahou/dotfiles](https://github.com/chuahou/dotfiles).

- `installscripts`: scripts to install specific configurations that may be
	specialised or not desired by default in a new installation
- `editorconfigs`: config files for editors with their specific scripts
- `check_git.sh`: a utility script that checks all sibling directories to ensure
	changes have been pushed to remote
- `setup_nonsudo.sh` and `setup_sudo.sh`: 2 scripts to quickly setup a new
	installation, the former to be run as user and the latter to be run as root
- `apt-install.sh`: installation of required apt packages from `apt-packages`
	with PPAs setup with scripts from `apt-ppas`

## New installation

	$ sudo ./setup_sudo.sh
	$ ./setup_nonsudo.sh
