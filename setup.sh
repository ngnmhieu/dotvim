######################################
#                                    #
# Setup script for vim configuration #
# @author ngnmhieu                   #
#                                    #
######################################

# git submodule update --init
vim +PluginInstall +qall

# compile YCM
cd ~/.vim/bundle/YouCompleteMe
python ./install.py
cd -
