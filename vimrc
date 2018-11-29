"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" vim-plug
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

" Automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

"@@@@@@@@@@ COMMON @@@@@@@@@@
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'ngnmhieu/nerdtree'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chase/vim-ansible-yaml'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
if !executable("cmake")
  echo "CMake is required to compile YouCompleteMe. Please install it before instaling YCM."
else
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
endif

"@@@@@@@@@@ HTML @@@@@@@@@@
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'

"@@@@@@@@@@ PHP @@@@@@@@@@
" Plug 'joonty/vdebug'

"@@@@@@@@@@ RAILS @@@@@@@@@@
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rails'

"@@@@@@@@@@ MARKDOWN @@@@@@@@@@
Plug 'tpope/vim-markdown'
" Plug 'gabrielelana/vim-markdown'
" Plug 'suan/vim-instant-markdown'

"@@@@@@@@@@ JAVASCRIPT @@@@@@@@@@
Plug 'mustache/vim-mustache-handlebars'
Plug 'isRuslan/vim-es6'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript' "
" Plug 'mxw/vim-jsx'
Plug 'neoclide/vim-jsx-improve'

"@@@@@@@@@@ Racket @@@@@@@@@@
" Plug 'wlangstroth/vim-racket'

"@@@@@@@@@@ LATEX @@@@@@@@@@
Plug 'LaTeX-Box-Team/LaTeX-Box'

"@@@@@@@@@@ SNIPPETS @@@@@@@@@@
" Plug 'SirVer/ultisnips'
Plug 'ngnmhieu/vim-snippets'
Plug 'tomtom/tlib_vim'             
Plug 'MarcWeber/vim-addon-mw-utils'

"@@@@@@@@@@ NGINX @@@@@@@@@@
Plug 'chr4/nginx.vim'

call plug#end()
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" END vim-plug
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Auto change directory to that of the opened file
" set autochdir

" appearance
colorscheme jellybeans

set modeline
set nu " line numbers
set expandtab " turn tabs into spaces
syntax on

set autoindent
set smartindent
set cindent
set cinkeys=0{,0},0#,!^F

set shiftround
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cursorline " underline current line
set incsearch " highlight as you search
set backspace=indent,eol,start " fix backspace key for vim 7.4

" Ignore uninterresting files and directory
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" change window spliting behavior
set splitbelow
set splitright

" show command when they are typed
set showcmd

" copy between vim processes
set clipboard^=unnamed,unnamedplus
" in MacOSX Terminal app, you must use MouseTerm plugin in SIMBL
set mouse=a

" change leader key to ,
let mapleader=','

" turn off preview window in omni auto complete
set completeopt-=preview

" Paste mode toggle, aid in pasting text with Ctrl-Shift-v
set pastetoggle=<leader>p

" Toggle cursorline when switching between normal and insert mode
autocmd InsertEnter,InsertLeave * set cul!

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" MAPPINGS
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@

" moving between lines
nnoremap j gj
nnoremap k gk

" navigating between viewports
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

" moving the current viewport to the edges
" nnoremap <silent> <leader>l <c-w>L
" nnoremap <silent> <leader>h <c-w>H
" nnoremap <silent> <leader>k <c-w>K
" nnoremap <silent> <leader>j <c-w>J

" move line up or down
function! MoveLine(direction)

  if a:direction == 'up'
    if line('.') == 1
      return
    elseif line('.') == line('$')
      execute 'normal! "add"aP'
    else
      execute 'normal! "addk"aP'
    endif
  elseif a:direction == 'down'
    if line('.') != line('$')
      execute 'normal! "add"ap'
    endif
  endif
endfunction

if has('mac')
  map ˚ :call MoveLine('up')<CR>
  map ∆ :call MoveLine('down')<CR>
else
  map <A-k> :call MoveLine('up')<CR>
  map <A-j> :call MoveLine('down')<CR>
endif


" remap go to first character of line
nnoremap ! ^
nnoremap ^ !
vnoremap ! ^
vnoremap ^ !
onoremap ! ^
onoremap ^ !
" ## end ##

" indenting
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv

" Pasting text without overriding yanked text
xnoremap p "_dP

" Paste to new line
" nnoremap <leader>p o<ESC>p
" nnoremap <leader>P O<ESC>p

" Next/Prev tab
nnoremap <S-TAB> :tabp<CR>
nnoremap <S-q> :tabn<CR>
noremap <C-n> :tabnew<CR>

" scrolling up down
nnoremap { <C-E>
nnoremap } <C-Y>

" convinient key to toggle hlsearch
nnoremap <silent> <space> :set hlsearch!<CR>

" search selected text
vnoremap <space> "zyq/"zp<CR><C-o>:set hlsearch<CR>

" search and replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" close current tab
nnoremap <expr> <leader>w tabpagenr('$') > 1 ? ':<C-U>exe ":tabclose " . (v:count > 0 ? v:count : "")<CR>' : ':qa<CR>' 
" close current buffer
nnoremap <leader>c :q<CR>
" switch to tab: `1,.` to open tab #1,  `2,.` to open tab #2 and so on
nnoremap <leader>. :<C-U>exe 'tabnext ' . (v:count > 0 ? v:count : '')<CR>
" alternative to switch tab
" for i in [1, 2, 3, 4, 5, 6, 7, 8, 9]
"   exe 'nnoremap <leader>'.i.' '.i.'gt'
" endfor

" Keyword AutoComplete (:help ins-completion)
" Accept the current autocomplete and exit INSERT mode
inoremap <C-z> <C-y><ESC>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" vim-instant-markdown
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" let g:vim_markdown_folding_disabled=1 " disable folding in markdown files
let g:instant_markdown_autostart=0 " to trigger use :InstantMarkdownPreview
" au BufRead,BufNewFile *.md set filetype=markdown


" remove delay in exiting visual mode
set timeoutlen=1000 ttimeoutlen=0

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Tcomment 
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
map <C-c> :TComment<CR>
vmap <C-b> :TCommentBlock<CR>

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Emmet
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
imap <C-b> <plug>(emmet-expand-abbr)

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" NERDTree
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
map <C-]> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
let g:nerdtree_tabs_autoclose = 1  
let NERDTreeIgnore = ['^CVS$']
let NERDTreeChDirMode = 2  

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Tabular
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t: :Tabularize /:<CR>
nmap <leader>t: :Tabularize /:<CR>
vmap <leader>tt :Tabularize /
nmap <leader>tt :Tabularize /

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" VIM Airline
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Show tab number
" let g:airline#extensions#tabline#enabled = 1 " enable vim-airline tabline
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#fnamemod = ':t:.'
" vim-airline appear all the time
set laststatus=2

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Vim default tabline format
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!Tabline()

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Quickfix
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
"Jump to next file in Quickfix
nnoremap <leader>m :cnf<CR>
" Jump to previous file in Quickfix
nnoremap <leader>n :cpf<CR>
" Adjust Quickfix window height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Folding
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
set foldmethod=indent
" all folds are open when a file is opened
set foldlevelstart=99
set foldnestmax=4

nnoremap <tab> za
" collapse / expand all folds
nnoremap _ zM 
nnoremap + zR

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" PHP
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
let php_folding = 1
let php_htmlInStrings = 1

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" map Ctrl-S to save file
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
command! -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" vim-autoclose
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" not doubling the whitespace
let g:AutoCloseExpandSpace = 0

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" vim-autoformat
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" let g:formatterpath = [$HOME."/.vim/etc/formatters/", $HOME."/.vim/etc/node_modules/.bin"]
" noremap <c-m> :Autoformat<CR>
" prevent fallback to vim's indent file
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" ultisnips
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" different keymap to trigger snipMate as YCM used tab
" let g:UltiSnipsExpandTrigger="<tab>"

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" YouCompleteMe Code-Completion
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
let g:ycm_key_list_select_completion = ['<Down>']
nnoremap <leader>d :YcmCompleter GoTo<CR>
vnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
vnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>f :YcmCompleter Fixit<CR>

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Syntastic Syntax Checking
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_html_checkers = []
" let g:syntastic_scss_checkers = []

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" vim-markdown
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
let g:markdown_enable_spell_checking = 0
let g:markdown_mapping_switch_status = '<leader>s'
" text formatting to BOLD in vim italic mode
set t_ZH=[1m
set t_ZR=

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" HTML
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" Go into tag 
nnoremap <leader>gt vit<ESC>

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" RAML
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
autocmd BufNewFile,BufRead *.raml set filetype=ansible

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" JSON-LD
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
autocmd BufNewFile,BufRead *.jsonld set filetype=json

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" EJS
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
autocmd BufNewFile,BufRead *.ejs set filetype=html

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" JSON
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
autocmd BufNewFile,BufRead *.json set tabstop=2
autocmd BufNewFile,BufRead *.json set shiftwidth=2
autocmd BufNewFile,BufRead *.json set softtabstop=2

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" CTRL-P
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'
" let g:ctrlp_working_path_mode = 'ra'

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" FZF
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@

" Installation path
set rtp+=~/.fzf

" search for files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <silent> <C-p> :FZF<CR>

" autocomplete file path
imap <c-f> <plug>(fzf-complete-file-ag)

" search file content
command! -bang -nargs=* SearchAg call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <silent> <C-d> :SearchAg<CR>
vnoremap <C-d> "ky:SearchAg <C-R>k<CR>

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" VIM-LATEX
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
autocmd BufNewFile,BufRead *.tex nnoremap <leader>ll :Latexmk<CR>
autocmd BufNewFile,BufRead *.tex nnoremap <leader>le :LatexErrors<CR>
autocmd BufNewFile,BufRead *.tex nnoremap <leader>lc :LatexmkClean<CR>
autocmd BufNewFile,BufRead *.tex nnoremap <leader>lv :LatexView<CR>

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" FUGITIVE
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function! Trim(str)
  return substitute(a:str, '\n\+$','', '')
endfunction

function! ToggleGitStatus()
  " close git status buffer if opened
  for bufno in tabpagebuflist()
    if Trim(bufname(bufno)) =~ ".git/index$"
      execute 'bdelete ' . bufno
      return
    endif
  endfor
  " open git status buffer and move to bottom
  execute 'bo Gstatus'
endfunction 

nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :call ToggleGitStatus()<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>ge :Gedit<CR>

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" GITGUTTER
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
autocmd BufWritePost * GitGutter

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" VUE
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
autocmd FileType vue syntax sync fromstart

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" ALE (Async Lint Engine)
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}
" fix cursor disappear on warning line
let g:ale_echo_cursor = 0

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" vim-multiple-cursors
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
let g:multi_cursor_start_word_key = '<C-m>'
let g:multi_cursor_next_key       = '<C-m>'
let g:multi_cursor_prev_key       = '<C-p>'
let g:mults_cursor_prev_key       = '<C-p>'
let g:multi_cursor_select_all_key = 'g<C-m>'

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" editorconfig-vim
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@

if !has('python') && !has('python3')
    echo "This vim distribution isn't compiled with +python or +python3. EditorConfig-Core is required to use editorconfig-vim plugin."
endif
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" vim-gutter
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@
nmap <leader>] <Plug>GitGutterNextHunk
nmap <leader>[ <Plug>GitGutterPrevHunk

" Include OS-specific configuration
let is_mac = has("gui_mac") || has("gui_macvim") || has("mac")
if is_mac
  source $HOME/.vim/vimrc_mac
else
  source $HOME/.vim/vimrc_linux
endif 
