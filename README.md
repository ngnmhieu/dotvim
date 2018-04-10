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

## plugin usage

### fugitive-git

**Glog** - view history of a particular file

Use `<leader>n` and `<leader>m` to go back and between the versions.

Execute `:cw` to view all the commits relating to the file.

**Gdiff** - compare current file with a given revision

`:Gdiff 0e7c` or `:Gdiff HEAD^`

It can also be done interactively by doing the following:

- Display the file history with `Glog`
- Navigate to the desired version using `<leader>n` and `<leader>m` or using the quickfix list with `:cw`
- Using `Gdiff` to compare it with the current version

Compare two different revision:

- Display file history with `Glog`
- Open first revision with `<Enter>`
- Open second revision with `<C-w><Enter>`
- Move the second revision to the right with `<C-w> l`
- `diffthis` on two revisions

## Useful Vim Tips / Shortcuts

**Viewport**

```
Ctrl-w = tells Vim to resize viewports to be of equal size.

Ctrl-w r will rotate windows to the r_ght.

Ctrl-w R will rotate windows to the left.
```

