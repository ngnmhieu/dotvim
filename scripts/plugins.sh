source $HOME/.vim/scripts/helpers.sh

echo "Installing vim plugins ..."

if hasNeoVIM; then
  nvim +PlugInstall +qa
elif hasVIM; then
  vim +PlugInstall +qa
fi
