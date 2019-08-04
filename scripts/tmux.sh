#!/bin/bash

source $HOME/.vim/scripts/helpers.sh

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

if isMac; then 
  if should_i_install reattach-to-user-namespace; then
    install_package reattach-to-user-namespace
  fi
fi

if isLinux; then 
  if should_i_install xclip; then
    install_package xclip
  fi
fi

echo "Configuration completed!"
