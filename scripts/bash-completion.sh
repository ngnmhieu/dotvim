#!/bin/bash

source $HOME/.vim/scripts/helpers.sh

echo "Installing bash completion"

(isMac && PACKAGE=bash-completion@2) || (isLinux && PACKAGE=bash-completion)
install_package $PACKAGE
