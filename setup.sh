######################################
#                                    #
# Setup script for vim configuration #
# @author ngnmhieu                   #
#                                    #
######################################

# won't work if Vundle is installed in bundle
# it must be installed in .vim directory
vim +PluginInstall +qall

# compile YCM
cd ~/.vim/bundle/YouCompleteMe
python ./install.py
cd -
