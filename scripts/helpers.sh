#!/bin/bash

function should_i_install () {
  PROGRAM=$1
  command -v $PROGRAM > /dev/null
  if [[ $? != 0 ]]; then
    if [[ $CONFIRM_ALL == 1 ]]; then
      INSTALL=Y
    else
      read -p "'$PROGRAM' is not installed. Do you want to install it? (Y/N): " INSTALL 
    fi

    if [[ $INSTALL == [yY] || $INSTALL == [yY][eE][sS] ]]; then
      echo "Installing $PROGRAM ..."
      return 0
    else
      echo "Skipping installation of '$PROGRAM'"
      return 1
    fi
  fi
  return 1
}

function install_package() {
  PROGRAM=$1
  if isMac; then 
    if has_program brew; then
      brew install $PROGRAM
    else
      echo "Brew is required for the installation. Please install brew first (https://brew.sh)."
    fi
  elif isLinux; then 
    (has_program apt-get && PACKAGE_MANAGER=apt-get) || (has_program yum && PACKAGE_MANAGER=yum) || PACKAGE_MANAGER=""
    if [[ $PACKAGE_MANAGER != "" ]]; then 
      $PACKAGE_MANAGER install bash-completion
    else
      echo "APT or YUM package manager is required for the installation. Please install one of them first."
    fi
  fi
}

function isMac () {
  if [[ $(uname) == "Darwin" ]]; then 
    return 0
  fi
  return 1
}

function isLinux () {
  if [[ $(uname) == "Linux" ]]; then 
    return 0
  fi
  return 1
}

function has_program () {
  command -v $1 > /dev/null
  return $?
}
