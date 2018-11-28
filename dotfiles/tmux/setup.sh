#!/bin/bash

## USAGE:
##   setup.sh [-y] 
## PARAMETERS:
##   -y   confirm all promts

PLATFORM=$(uname)
[[ "$1" == "-y" || "$1" == "-Y" ]] && CONFIRM_ALL=1 || CONFIRM_ALL=0
CONF_PATH=$HOME/.vim/dotfiles/tmux/tmux.conf
LINK_PATH=$HOME/.tmux.conf

# Program installation helper
install_program () {
  if [[ $PLATFORM == "Darwin" ]]; then 
    INSTALL_COMMAND="brew install"
  else
    INSTALL_COMMAND="sudo apt install"
  fi

  $INSTALL_COMMAND $1
}

check_command_existance () {
  PROGRAM=$1
  command -v $PROGRAM > /dev/null
  if [[ $? != 0 ]]; then
    if [[ $CONFIRM_ALL == 1 ]]; then
      INSTALL=Y
    else
      read -p "'$PROGRAM' is required for copying to clipboard to work. Do you want to install it? (Y/N): " INSTALL 
    fi

    if [[ $INSTALL == [yY] || $INSTALL == [yY][eE][sS] ]]; then
      echo "Installing $PROGRAM ..."
      install_program $PROGRAM
    else
      echo "Skipping installation of '$PROGRAM'"
    fi
  fi
}

echo "Configuring TMUX ..."

if [[ -L "$LINK_PATH" ]]; then
  if [[ $CONFIRM_ALL == 1 ]]; then
    OVERWRITE=Y
  else
    read -p "A configuration file already existed at $LINK_PATH - Overwrite? (Y/N): " OVERWRITE
  fi

  if [[ $OVERWRITE == [yY] || $OVERWRITE == [yY][eE][sS] ]]; then
    rm $LINK_PATH
  else
    echo "Configuration aborted"
    exit 1;
  fi
fi

if [[ ! -L "$LINK_PATH" ]]; then
  echo "Creating soft link for tmux.conf ..."
  ln -s $CONF_PATH $LINK_PATH
fi

echo "Checking dependencies ..."

if [[ $PLATFORM == "Darwin" ]]; then 
  check_command_existance reattach-to-user-namespacex
else
  check_command_existance xclip 
fi

echo "Configuration completed!"
