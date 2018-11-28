#!/bin/bash

######################################
#                                    #
# Setup script for vim configuration #
# @author ngnmhieu                   #
#                                    #
######################################

PLATFORM=$(uname)
[[ "$1" == "-y" || "$1" == "-Y" ]] && CONFIRM_ALL=1 || CONFIRM_ALL=0
CONF_PATH=$HOME/.vim/vimrc_common
LINK_PATH=$HOME/.vimrc

if [[ -L "$LINK_PATH" ]]; then
  if [[ $CONFIRM_ALL == 1 ]]; then
    OVERWRITE=Y
  else
    read -p "A .vimrc file already existed at $LINK_PATH - Overwrite? (Y/N): " OVERWRITE
  fi

  if [[ $OVERWRITE == [yY] || $OVERWRITE == [yY][eE][sS] ]]; then
    rm $LINK_PATH
  fi
fi

if [[ ! -L "$LINK_PATH" ]]; then
  echo "Creating soft link for .vimrc ..."
  ln -s $CONF_PATH $LINK_PATH
fi

echo "Installing vim plugins ..."
vim +PlugInstall +qa

echo "Setup completed!"
