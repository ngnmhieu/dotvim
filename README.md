dotvim
======
Git and Github enables easy configuration files synchronisation and management across machines and OSes.
This repository contains configuration files for my Vim Editor. Using git branch help separating different configs for different OSses, but still storing common files in one place.

Installation
------------

Clone this project
```
$ cd ~
$ git clone git@github.com:ngnmhieu/dotvim.git
$ mv dotvim .vim
```
Checkout all the submodule
```
$ cd .vim
$ git submodule update --init
```

Make symbolic link `~/.vimrc` point to `~/.vim/vimrc`
```
$ ln -s ~/.vim/vimrc ~/.vimrc
```

