dotvim
======
Git and Github enables easy configuration files synchronisation and management across machines and OSes.
This repository contains configuration files for my Vim Editor.

installation
------------

Clone this project
```
$ cd ~
$ git clone https://github.com/ngnmhieu/dotvim.git
$ mv dotvim .vim
```
Run the setup script, which executes the followings:
- Checkout all the submodule
```
$ cd .vim
$ sh setup.sh
```

Make symbolic link `~/.vimrc` point to `~/.vim/vimrc_*` file
```
$ ln -s ~/.vim/vimrc_[common|mac|linux] ~/.vimrc
```

requirements for plugins
------------------------

### vim-autoformat

In order to use vim-autoformat for a specific language, the corresponding external formatters must be installed
globally or in 
```
~/.vim/etc/formatters/
```
More information see: [vim-autoformat](https://github.com/Chiel92/vim-autoformat)
