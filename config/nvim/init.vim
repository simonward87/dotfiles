set exrc 			                        " allow local vimrc
set guicursor=		                        " block cursor
set number
set relativenumber
set nohlsearch                              " highlight doesn't persist after search
set hidden                                  " allow background unsaved buffers
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nowrap                                  " no line-wrapping
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch                               " show search results per keystroke
set termguicolors                           " allow true color
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set cursorline                              " highlight current line
set colorcolumn=80                          " 80 character guide rule
set signcolumn=number
set updatetime=50
set clipboard=unnamedplus                   " used system clipboard

" autoinitialize Vim Plug if not already set up
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'sbdchd/neoformat'       " prettier

Plug 'axvr/photon.vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'gruvbox-community/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'yasukotelin/notelight'

call plug#end()


let mapleader=" "

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup AUTOTRIM_WHITESPACE
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

autocmd FileType markdown setlocal wrap

colorscheme tender

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif
