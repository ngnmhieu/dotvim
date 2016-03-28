dotvim
======
Git and Github enables easy configuration files synchronisation and management across machines and OSes.
This repository contains configuration files for my Vim Editor.

Installation
------------

Clone this project
```
$ cd ~
$ git clone git@github.com:ngnmhieu/dotvim.git
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
$ ln -s ~/.vim/vimrc_[mac|linux] ~/.vimrc
```

