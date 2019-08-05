#!/bin/bash

source $HOME/.vim/scripts/helpers.sh

INITVIM_PATH=$HOME/.vim/init.vim
CONF_PATH=$HOME/.config/nvim
LINK_PATH=$CONF_PATH/init.vim

# create config directory
mkdir -p $CONF_PATH

if [[ -L "$LINK_PATH" ]]; then
  read -p "A init.vim file already existed at $LINK_PATH - Overwrite? (Y/N): " OVERWRITE
  if [[ $OVERWRITE == [yY] || $OVERWRITE == [yY][eE][sS] ]]; then
    rm $LINK_PATH
  fi
fi

if [[ ! -L "$LINK_PATH" ]]; then
  echo "Creating soft link for vim.init ..."
  ln -s $INITVIM_PATH $LINK_PATH
fi

echo "Setup completed!"
