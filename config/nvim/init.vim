set completeopt=menuone,longest,noinsert,noselect   " text completion
set cursorline                                      " current line highlight
set expandtab                                       " convert tabs to spaces
set ignorecase                                      " case-insensitive search
set iskeyword+=-                                    " treat dash-separation as word text object
set mouse=nicr                                      " enable mouse 
set noerrorbells                                    " mute error sound
set nohlsearch
set noswapfile                                      " new buffers created without swapfiles
set nowrap                                          " disable line wrapping
set number                                          " enable line numbers
set relativenumber                                  " enable relative line numbers
set scrolloff=8                                     " scroll limit from screenY boundaries
set shiftwidth=2                                    " updates shift-width value
set shortmess+=c                                    " avoid file message prompts
set sidescrolloff=8                                 " scroll limit from screenX boundaries
set smartcase                                       " case-sensitive search on capital letter
set softtabstop=2                                   " 2 spaces for tabs during editing
set tabstop=2                                       " 2 spaces for tabs 
set undofile                                        " save undo history to dedicated file
set updatetime=300                                  " swapfile written after time in ms

autocmd FileType markdown setlocal wrap

" autoinitialize Vim Plug if not already set up
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" plugins
Plug 'alvan/vim-closetag'                                   " auto-close html, jsx, tsx tags
Plug 'ctrlpvim/ctrlp.vim'                                   " fuzzy finder
Plug 'djoshea/vim-autoread'                                 " auto reload files when changed externally
Plug 'evanleck/vim-svelte', {'branch': 'main'}              " syntax highlighting & indentation, Svelte
Plug 'leafgarland/typescript-vim'                           " ts syntax files
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }   " hex code colourizer
Plug 'pangloss/vim-javascript'                              " syntax highlighting & indentation, JavaScript
Plug 'tpope/vim-commentary'                                 " comment stuff out
Plug 'tpope/vim-fugitive'                                   " git wrapper
Plug 'tpope/vim-surround'                                   " streamline surroundings workflow
Plug 'neovim/nvim-lspconfig'                                " lsp client configs
Plug 'hrsh7th/nvim-compe'                                   " lsp completion
Plug 'hrsh7th/vim-vsnip'                                    " lsp snippets
Plug 'simrat39/rust-tools.nvim'                             " config and tools for ls
Plug 'rust-analyzer/rust-analyzer'                          " rust language server
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " better syntax highlighting
Plug 'nvim-treesitter/playground'                           " playground for nvim-treesitter

" themes
Plug 'axvr/photon.vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
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
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|__sapper__\|dist\|dotbot\|build'
" let g:gruvbox_material_palette='mix'
" let g:gruvbox_material_background='hard'
" let g:everforest_background='hard'
let g:Hexokinase_highlighters=['backgroundfull']
let g:loaded_perl_provider=0
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

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

set bg=light
colo antiphoton

lua require("lsp-config")
