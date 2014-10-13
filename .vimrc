set nocompatible

filetype on
filetype plugin on
filetype indent on
syntax on
scriptencoding utf-8

set rtp+=~/.vim/bundle/Vundle.vim
set encoding=utf-8

call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/unite.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'techlivezheng/vim-plugin-minibufexpl'
Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/syntastic'
Plugin 'edkolev/tmuxline.vim'

call vundle#end()

filetype plugin indent on  
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'
let g:NERDTreeDirArrows=1
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ 

set autowrite

set ruler
set timeoutlen=500
set hidden
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab
set showcmd
set number
set smartindent
set autoindent
set laststatus=2
set linespace=1
set wrap
set textwidth=79
set formatoptions=qrn1
set incsearch
set hlsearch
set ignorecase
set smartcase

nnoremap <leader>q gqip
set foldenable

set mousehide
nnoremap <leader>ft Vatzf
nnoremap <leader>v <C-w>v<C-w>l

set splitbelow              
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
abbrev ff :! open -a firefox.app %:p<cr>

nmap <leader>d :cd ~/Desktop<cr>:e.<cr>

nmap <leader>ev :tabedit $MYVIMRC<cr>

let g:user_zen_expandabbr_key = '<C-e>'

map <leader>c <c-_><c-_>
nmap <space> :

autocmd BufEnter * cd %:p:h
imap <leader><tab> <C-x><C-o>

set wildmenu

set wildmode=list:longest

set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

imap jj <esc>

nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

nmap <C-Up> ddkP
nmap <C-Down> ddp

vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <leader>nt :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

iab teh the
iab Teh The

nmap <leader>hm :cd ~/ <CR>

:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

nmap <leader>bv :bel vsp
au FocusLost * :wa

set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
set backup 

set showmatch

map! ;h <a href=""></a><ESC>5hi
