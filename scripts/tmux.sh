#!/bin/bash

## USAGE:
##   setup.sh [-y] 
## PARAMETERS:
##   -y   confirm all promts
source $HOME/.vim/scripts/helpers.sh

PLATFORM=$(uname)
[[ "$1" == "-y" || "$1" == "-Y" ]] && CONFIRM_ALL=1 || CONFIRM_ALL=0
CONF_PATH=$HOME/.vim/dotfiles/tmux/tmux.conf
LINK_PATH=$HOME/.tmux.conf

echo "Configuring TMUX ..."

if [[ -L "$LINK_PATH" ]]; then
  read -p "A configuration file already existed at $LINK_PATH - Overwrite? (Y/N): " OVERWRITE
  if [[ $OVERWRITE == [yY] || $OVERWRITE == [yY][eE][sS] ]]; then
    rm $LINK_PATH
  fi
fi

if [[ ! -L "$LINK_PATH" ]]; then
  echo "Creating soft link for tmux.conf ..."
  ln -s $CONF_PATH $LINK_PATH
fi

echo "Checking dependencies ..."

if [[ $PLATFORM == "Darwin" ]]; then 
  should_i_install reattach-to-user-namespace 
  if [[ $? == 0 ]]; then
    brew install reattach-to-user-namespace
  fi
fi

if [[ $PLATFORM == "Linux" ]]; then 
  should_i_install xclip
  if [[ $? == 0 ]]; then
    sudo apt install xclip
  fi
fi

echo "Configuration completed!"