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
