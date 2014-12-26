if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" appearance
colorscheme tomorrow_night

set nocompatible " less compatible wiht Vi, Vim behaves better
set nu " line numbers
set expandtab " turn tabs into spaces
syntax on

set autoindent
set smartindent
set cindent
set cinkeys=0{,0},0#,!^F

set tabstop=2
set shiftwidth=2
set softtabstop=2
set cursorline " underline current line
set incsearch " highlight as you search
set backspace=indent,eol,start " fix backspace key for vim 7.4

" change window spliting behavior
set splitbelow
set splitright

" copy between vim processes
set clipboard=unnamed
" in MacOSX Terminal app, you must use MouseTerm plugin in SIMBL
set mouse=a

filetype plugin indent on


"" map Ctrl-S to save file
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>

" pathogen - plugin manager
execute pathogen#infect()
Helptags

"################
"### MAPPINGS ###
"################

  "@@@@@@@@@@@@@@@@@
  " folding shortcut
  "@@@@@@@@@@@@@@@@@
  nnoremap <tab> za
  " collapse / expand all folds
  nnoremap _ zM 
  nnoremap + zR

" moving between lines
nnoremap j gj
nnoremap k gk

" remap switching split windows
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

" remap go to first character of line
nnoremap ! ^
nnoremap ^ !
vnoremap ! ^
vnoremap ^ !
onoremap ! ^
onoremap ^ !
" ## end ##

" reformat whole file, need fix
" nmap <c-f> gg=G<C-o><C-o>

"---- next tab
nnoremap <S-TAB> :tabp<CR>
nnoremap <S-q> :tabn<cr>
map <C-n> :tabnew<cr>

" scrolling up down
nnoremap { <C-E>
nnoremap } <C-Y>

" convinient key to toggle hlsearch
nnoremap <silent> <space> :set hlsearch!<CR>

" search selected text
vnoremap <space> "zyq/"zp<CR>
vnoremap <M-space> "zyq?"zp<CR>

" search and replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" change leader key to ,
let mapleader=','

" close current tab
nnoremap <expr> <leader>w tabpagenr('$') > 1 ? ':tabclose<CR>' : ':q<CR>' 
" close current buffer
nnoremap <leader>c :q<CR>

" Command-T
let g:CommandTCancelMap=['<C-[>', '<ESC>']


" open current file in sublime text
map <F4> :!subl %<cr> 

" Keyword AutoComplete (:help ins-completion)
" Accept the current autocomplete and exit INSERT mode
inoremap <C-z> <C-y><ESC>

" NerdTree
map <C-]> :NERDTreeToggle<CR>
map <F7> :NERDTreeToggle<CR>
" let NERDTreeShowLineNumbers=1

" Tcomment - toggle comment
map <c-c><c-c> <c-_><c-_>
map <c-c>b :TCommentBlock<CR>
" Emmet trigger
let g:user_emmet_expandabbr_key = '<c-b>'

" indent level to specific filetypes
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType racket setlocal shiftwidth=2 tabstop=2

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" vim-markdown
let g:vim_markdown_folding_disabled=1 " disable folding in markdown files
au BufRead,BufNewFile *.md set filetype=markdown

" remove delay in exiting visual mode
set timeoutlen=1000 ttimeoutlen=0

" vim-airline appear all the time
set laststatus=2

"@@@@@@@@@@@@@@@@@
" Folding
"@@@@@@@@@@@@@@@@@

" all folds are open when a file is opened
set foldlevelstart=99

"@@@@@@@@@@@@@@@@@
" PHP
"@@@@@@@@@@@@@@@@@
let php_folding = 1
let php_htmlInStrings = 1

" turn off preview window in omni auto complete
set completeopt-=preview

"@@@@@@@@@@@@@@@@@
" RUBY
"@@@@@@@@@@@@@@@@@
autocmd FileType eruby let b:surround_45 = "<%= \r %>"
