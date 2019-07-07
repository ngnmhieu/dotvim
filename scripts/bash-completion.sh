#!/bin/bash

source $HOME/.vim/scripts/helpers.sh

echo "Installing bash completion"

isMac
if [[ $? == 0 ]]; then 
  hasBREW
  if [[ $? == 0 ]]; then
    brew install bash-completion@2
  else
    echo "Brew is required for the installation. Please install brew first (https://brew.sh)."
  fi
fi

isLinux
if [[ $? == 0 ]]; then 
  PACKAGE_MANAGER=""
  hasAPT
  if [[ $? == 0 ]]; then
    PACKAGE_MANAGER=apt-get
  else
    hasYUM
    if [[ $? == 0 ]]; then
      PACKAGE_MANAGER=YUM
    fi
  fi

  if [[ $PACKAGE_MANAGER != "" ]]; then 
    $PACKAGE_MANAGER install bash-completion
  else
    echo "APT or YUM package manager is required for the installation. Please install one of them first."
  fi
fi
