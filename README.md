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

Make symbolic link `~/.vimrc` point to `~/.vim/vimrc_*` file
```
$ ln -s ~/.vim/vimrc_[common|mac|linux] ~/.vimrc
```

Run the setup script, which executes the followings:
```
$ cd .vim
$ sh setup.sh
```

plugin requirements
-------------------

`fzf` and `ag` must be installed before fzf.vim plugin can be used  - [Github](https://github.com/junegunn/fzf)
