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

" tell vim where to find tags file
set tags=./tags

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

" Pasting text without overriding yanked text
xnoremap p "_dP

" Next/Prev tab
nnoremap <S-TAB> :tabp<CR>
nnoremap <S-q> :tabn<cr>
map <C-n> :tabnew<cr>

" Go to tab number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt


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

" VCSCommand
let g:VCSCommandMapPrefix='<Leader>v'

" open current file in sublime text
map <F4> :!subl %<cr> 

" Keyword AutoComplete (:help ins-completion)
" Accept the current autocomplete and exit INSERT mode
inoremap <C-z> <C-y><ESC>

" NerdTree
map <C-]> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_autoclose = 1  
" let NERDTreeShowLineNumbers = 1

" Tcomment - toggle comment
map <c-c> <c-_><c-_>
vmap <c-b> :TCommentBlock<CR>

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

"@@@@@@@@@@@@@@@@
" Searching with Ack
"@@@@@@@@@@@@@@@@
" search the for files containing selected text with Ack (ignore hidden files)
" -o is to output only the matched pattern
" -Q match literal string
let g:ack_default_options = " -s -H --nocolor --nogroup --ignore-file=match:'^\\.' -o -Q"
vnoremap <C-k> "ky:Ack '<C-R>k' <CR>/<C-R>k<CR>
vnoremap <C-l> "ky:Ack '<C-R>k'
"@@@@ END Searching with Ack @@@@

"@@@@@@@@@@@@@@@@
" Quickfix
"@@@@@@@@@@@@@@@@
"Jump to next file in Quickfix
nnoremap <leader>n :cnf<CR>
"Jump to previous file in Quickfix
nnoremap <leader>p :cpf<CR>

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

" snippet '=' => <%= %>
autocmd FileType eruby let b:surround_45 = "<%= \r %>"
autocmd FileType ruby set foldmethod=syntax

