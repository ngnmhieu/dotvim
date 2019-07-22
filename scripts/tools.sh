#!/bin/bash

source $HOME/.vim/scripts/helpers.sh

echo "Installing tools..."

hasNPM
if [[ $? == 0 ]]; then 
  cd ./tools && npm install
else
  echo "NPM is required for the installation. Please install it first."
fi
