source $HOME/.vim/scripts/helpers.sh

echo "Installing vim plugins ..."

if has_program nvim; then
  nvim +PlugInstall +qa
elif has_program vim; then
  vim +PlugInstall +qa
fi
