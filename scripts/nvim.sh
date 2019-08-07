#!/bin/bash

source $HOME/.vim/scripts/helpers.sh

INITVIM_PATH=$HOME/.vim/init.vim
CONF_PATH=$HOME/.config/nvim
LINK_PATH=$CONF_PATH/init.vim

# create config directory
mkdir -p $CONF_PATH

if [[ -L "$LINK_PATH" ]]; then
  read -p "A init.vim file already existed at $LINK_PATH - Overwrite? (Y/N): " OVERWRITE
  if [[ $OVERWRITE == [yY] || $OVERWRITE == [yY][eE][sS] ]]; then
    rm $LINK_PATH
  fi
fi

if [[ ! -L "$LINK_PATH" ]]; then
  echo "Creating soft link for vim.init ..."
  ln -s $INITVIM_PATH $LINK_PATH
fi

echo "Installing providers for neovim (python, ruby, nodejs) ...\n"

echo "Installing node provider..."
if has_program npm; then 
  npm install -g neovim
fi

echo "Installing python provider..."
PIP_VERSIONS=(
  pip3
  pip2
  pip
)
for PIP in ${PIP_VERSIONS[@]}; do
  if has_program $PIP; then 
    $PIP install --upgrade pynvim
  fi
done

echo "Installing ruby provider..."
if has_program gem; then 
  gem install neovim
  if ! $?; then
    read -p "Ruby provider for neovim installation unsuccessful, do you want to re-try with sudo? (Y/N): " WITH_SUDO
    if [[ $WITH_SUDO == [yY] || $WITH_SUDO == [yY][eE][sS] ]]; then
      sudo gem install neovim
  fi
  fi
fi

echo "Setup completed!"
