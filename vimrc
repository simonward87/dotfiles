syntax enable
filetype plugin indent on

set backspace=indent,eol,start                  " restore default backspace behaviour
set completeopt=menuone,longest                 " text completion
set cursorline                                  " current line highlight
set encoding=utf-8                              " set internal encoding
set expandtab                                   " convert tabs to spaces
set hidden                                      " keep multiple buffers open
set ignorecase                                  " case-insensitive search
set incsearch                                   " updates search results per-character
set iskeyword+=-                                " treat dash-separation as word text object
set mouse=nicr                                  " enable mouse 
set nobackup                                    " coc recommendation
set noerrorbells                                " mute error sound
set noswapfile                                  " new buffers created without swapfiles
set nowrap                                      " disable line wrapping
set nowritebackup                               " coc recommendation
set number                                      " enable line numbers
set relativenumber                              " enable relative line numbers
set ruler                                       " show cursor location
set scrolloff=5                                 " scroll limit in lines from screen boundaries
set shiftwidth=2                                " updates shift-width value
set shortmess+=c                                " avoid file message prompts
set smartcase                                   " case-sensitive search on capital letter
set smarttab                                    " indents according to shiftwidth 
set softtabstop=2                               " 2 spaces for tabs during editing
set tabstop=2                                   " 2 spaces for tabs 
set ttyfast                                     " optimize for fast terminal connections
set undodir=~/.vim/undodir                      " directory for undo history files
set undofile                                    " save undo history to dedicated file
set updatetime=300                              " swapfile written after time in ms
set wildmenu                                    " enhanced command completion

" Auto-initialize Vim Plug if not already set up
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'alvan/vim-closetag'                       " auto-close html, jsx, tsx tags
Plug 'andreasvc/vim-256noir'										" monochrome theme
Plug 'arcticicestudio/nord-vim'                 " theme
Plug 'ctrlpvim/ctrlp.vim'                       " fuzzy finder
Plug 'evanleck/vim-svelte', {'branch': 'main'}  " syntax highlighting & indentation, Svelte
Plug 'jacoborus/tender.vim'                     " theme
Plug 'jremmen/vim-ripgrep'                      " fast search
Plug 'leafgarland/typescript-vim'               " ts syntax files
Plug 'lilydjwg/colorizer'                       " hex code colourizer
Plug 'mattn/emmet-vim'                          " expanding abbreviations
Plug 'mbbill/undotree'                          " undo history visualizer
Plug 'morhetz/gruvbox'                          " theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " extensions and language servers
Plug 'pangloss/vim-javascript'                  " syntax highlighting & indentation, JavaScript
Plug 'rakr/vim-one'                             " theme
Plug 'tpope/vim-commentary'                     " comment stuff out
Plug 'tpope/vim-fugitive'                       " git wrapper
Plug 'tpope/vim-surround'                       " streamline surroundings workflow

call plug#end()

let mapleader=" "

let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.js,*.tsx,*.svelte'
let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx,*.js,*.tsx,*.svelte'
let g:closetag_filetypes = 'html,xhtml,jsx,js,tsx,svelte'
let g:closetag_xhtml_filetypes = 'xml,xhtml,jsx,js,tsx,svelte'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-htmlhint',
      \ 'coc-css',
      \ 'coc-deno',
      \ 'coc-go',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-toml',
      \ 'coc-svelte',
      \ 'coc-styled-components',
      \ 'coc-sh',
      \ ]
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|__sapper__\|dist'
let g:netrw_banner=0
let g:netrw_browse_split=2
let g:netrw_winsize=25
let g:svelte_preprocessor_tags = [
\ { 'name': 'ts', 'tag': 'script', 'as': 'typescript'}
\ ]
let g:svelte_preprocessors = ['ts']

nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>o :wincmd o<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set bg=dark
colo gruvbox

" if strftime("%H") < 12
"   set bg=light
" else
"   set bg=dark
" endif

" set cmdheight=2                                 " increase message space
" set cursorcolumn                                " current column highlight
" set nohlsearch                                  " remove search highlighting
" set noshowmode                                  " remove mode UI
" set scrolloff=999                               " cursor always centered
