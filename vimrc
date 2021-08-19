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
set scrolloff=7                                 " scroll limit from screenY boundaries
set shiftwidth=2                                " updates shift-width value
set shortmess+=c                                " avoid file message prompts
set sidescrolloff=5                             " scroll limit from screenX boundaries
set smartcase                                   " case-sensitive search on capital letter
set smarttab                                    " indents according to shiftwidth 
set softtabstop=2                               " 2 spaces for tabs during editing
set tabstop=2                                   " 2 spaces for tabs 
set ttyfast                                     " optimize for fast terminal connections
set undodir=~/.vim/undodir                      " directory for undo history files
set undofile                                    " save undo history to dedicated file
set updatetime=300                              " swapfile written after time in ms
set wildmenu                                    " enhanced command completion

autocmd FileType markdown setlocal wrap

" Auto-initialize Vim Plug if not already set up
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'alvan/vim-closetag'                       " auto-close html, jsx, tsx tags
Plug 'ctrlpvim/ctrlp.vim'                       " fuzzy finder
Plug 'djoshea/vim-autoread'                     " auto reload files when changed externally
Plug 'evanleck/vim-svelte', {'branch': 'main'}  " syntax highlighting & indentation, Svelte
Plug 'leafgarland/typescript-vim'               " ts syntax files
Plug 'lilydjwg/colorizer'                       " hex code colourizer
Plug 'mattn/emmet-vim'                          " expanding abbreviations
Plug 'mbbill/undotree'                          " undo history visualizer
Plug 'neoclide/coc.nvim', {'branch': 'release'} " extensions and language servers
Plug 'pangloss/vim-javascript'                  " syntax highlighting & indentation, JavaScript
Plug 'tpope/vim-commentary'                     " comment stuff out
Plug 'tpope/vim-fugitive'                       " git wrapper
Plug 'tpope/vim-surround'                       " streamline surroundings workflow
Plug 'acarapetis/vim-colors-github'
Plug 'arcticicestudio/nord-vim'                 " theme
Plug 'axvr/photon.vim'                          " theme
Plug 'davidosomething/vim-colors-meh'           " theme
Plug 'everard/vim-aurora'
Plug 'jacoborus/tender.vim'                     " theme
Plug 'meain/hima-vim'
Plug 'morhetz/gruvbox'                          " theme
Plug 'yasukotelin/notelight'

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
      \ 'coc-css',
      \ 'coc-deno',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-go',
      \ 'coc-html',
      \ 'coc-htmlhint',
      \ 'coc-json',
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-styled-components',
      \ 'coc-svelte',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \ ]
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|__sapper__\|dist\|dotbot\|build'
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
  set signcolumn=auto
endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

set bg=light
colo notelight

" set bg=dark
" colo tender

" if strftime("%H") < 18
"   set bg=light
"   colo antiphoton
" else
"   set bg=dark
"   colo photon
" endif
