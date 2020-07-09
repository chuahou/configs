#!/bin/bash
#
# Installs Oh My Zsh
#
# Do NOT run as ROOT.

# check not root
$(dirname "$0")/check_root.sh user || exit 1

# remind to Ctrl+D after running below
echo "PRESS CTRL+D AFTER INSTALLATION TO RUN REST OF SCRIPT"

# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# undo the removal of zshrc
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
