" autoinitialize Vim Plug if not already set up
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'alvan/vim-closetag'                                   " auto-close tags
Plug 'BurntSushi/ripgrep'                                   " telescope dependency
Plug 'djoshea/vim-autoread'                                 " auto reload files when changed externally
Plug 'evanleck/vim-svelte', {'branch': 'main'}              " syntax highlighting & indentation, Svelte
Plug 'hrsh7th/nvim-compe'                                   " lsp completion
Plug 'hrsh7th/vim-vsnip'                                    " lsp snippets
Plug 'leafgarland/typescript-vim'                           " ts syntax files
Plug 'mlaursen/vim-react-snippets'                          " React snippets
Plug 'neovim/nvim-lspconfig'                                " lsp client configs
Plug 'nvim-lua/popup.nvim'                                  " overlay popups
Plug 'nvim-lua/plenary.nvim'                                " telescope dependency
Plug 'nvim-telescope/telescope.nvim'                        " fuzzy finder
Plug 'nvim-telescope/telescope-fzy-native.nvim'             " native sorter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " better syntax highlighting
Plug 'nvim-treesitter/playground'                           " playground for nvim-treesitter
Plug 'pangloss/vim-javascript'                              " syntax highlighting & indentation, JavaScript
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }   " hex code colourizer
" Plug 'sbdchd/neoformat'                                     " prettier
Plug 'sharkdp/fd'                                           " finder for telescope
Plug 'simrat39/rust-tools.nvim'                             " config and tools for ls
Plug 'SirVer/ultisnips'                                     " Utility snippets
Plug 'tpope/vim-commentary'                                 " comment stuff out
Plug 'tpope/vim-fugitive'                                   " git wrapper
Plug 'tpope/vim-surround'                                   " streamline surroundings workflow

Plug 'axvr/photon.vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'gruvbox-community/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'mcchrish/zenbones.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'

call plug#end()
