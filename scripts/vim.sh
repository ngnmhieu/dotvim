#!/bin/bash

source $HOME/.vim/scripts/helpers.sh

PLATFORM=$(uname)
[[ "$1" == "-y" || "$1" == "-Y" ]] && CONFIRM_ALL=1 || CONFIRM_ALL=0
CONF_PATH=$HOME/.vim/vimrc
LINK_PATH=$HOME/.vimrc

if [[ -L "$LINK_PATH" ]]; then
  read -p "A .vimrc file already existed at $LINK_PATH - Overwrite? (Y/N): " OVERWRITE
  if [[ $OVERWRITE == [yY] || $OVERWRITE == [yY][eE][sS] ]]; then
    rm $LINK_PATH
  fi
fi

if [[ ! -L "$LINK_PATH" ]]; then
  echo "Creating soft link for .vimrc ..."
  ln -s $CONF_PATH $LINK_PATH
fi

echo "Checking dependencies ..."
should_i_install fzf
if [[ $? == 0 ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
fi

should_i_install ag
if [[ $? == 0 ]]; then
  if [[ $PLATFORM == "Darwin" ]]; then 
    brew install the_silver_searcher
  else
    sudo apt install silversearcher-ag
  fi
fi

should_i_install cmake
if [[ $? == 0 ]]; then
  if [[ $PLATFORM == "Darwin" ]]; then 
    brew install cmake
  else
    sudo apt install cmake
  fi
fi

echo "Setup completed!"
