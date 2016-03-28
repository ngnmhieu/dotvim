#!/bin/sh
module=bundle/$1
vim_path=~/.vim
if [[ -d $vim_path/$module_path ]]; then
    git submodule deinit $vim_path/$module 
    git rm -rf $vim_path/$module 
    rm -rf $vim_path/.git/modules/$module
fi
