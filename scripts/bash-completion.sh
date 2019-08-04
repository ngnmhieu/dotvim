#!/bin/bash

source $HOME/.vim/scripts/helpers.sh

echo "Installing bash completion"

if isMac; then 
  if hasBREW; then
    brew install bash-completion@2
  else
    echo "Brew is required for the installation. Please install brew first (https://brew.sh)."
  fi
fi


if isLinux; then 
  PACKAGE_MANAGER=""
  
  if hasAPT; then
    PACKAGE_MANAGER=apt-get
  elif hasYUM; then
    PACKAGE_MANAGER=yum
  fi

  if [[ $PACKAGE_MANAGER != "" ]]; then 
    $PACKAGE_MANAGER install bash-completion
  else
    echo "APT or YUM package manager is required for the installation. Please install one of them first."
  fi
fi
