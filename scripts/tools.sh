#!/bin/bash

source $HOME/.vim/scripts/helpers.sh

echo "Installing tools..."

if has_program npm; then 
  cd ./tools && npm install
else
  echo "NPM is required for the installation. Please install it first."
fi
