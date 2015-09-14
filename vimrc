source ~/.vim/vimrc_common

"@@@@@@@@@@@@@@@@@
" RUBY
"@@@@@@@@@@@@@@@@@
" indent
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

" snippet '=' => <%= %>
autocmd FileType eruby let b:surround_45 = "<%= \r %>"
autocmd FileType ruby set foldmethod=syntax

