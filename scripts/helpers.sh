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
    if hasBREW; then
      brew install $PROGRAM
    else
      echo "Brew is required for the installation. Please install brew first (https://brew.sh)."
    fi
  elif isLinux; then 
    (hasAPT && PACKAGE_MANAGER=apt-get) || (hasYUM && PACKAGE_MANAGER=yum) || PACKAGE_MANAGER=""
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

function hasNPM () {
  command -v brew > /dev/null
  return $?
}

function hasBREW () {
  command -v brew > /dev/null
  return $?
}

function hasAPT () {
  command -v apt-get > /dev/null
  return $?
}

function hasVIM() {
  command -v vim > /dev/null
  return $?
}

function hasNeoVIM() {
  command -v nvim > /dev/null
  return $?
}
