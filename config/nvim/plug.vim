" autoinitialize Vim Plug if not already set up
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ------------------------------------------------------------- GENERIC PLUGINS

Plug 'alvan/vim-closetag'                                   " auto-close tags
Plug 'djoshea/vim-autoread'                                 " auto reload files when changed externally
Plug 'evanleck/vim-svelte', {'branch': 'main'}              " syntax highlighting & indentation, Svelte
Plug 'leafgarland/typescript-vim'                           " ts syntax files
Plug 'mlaursen/vim-react-snippets'                          " React snippets
Plug 'pangloss/vim-javascript'                              " syntax highlighting & indentation, JavaScript
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }   " hex code colourizer
Plug 'tpope/vim-commentary'                                 " comment stuff out
Plug 'tpope/vim-fugitive'                                   " git wrapper
Plug 'tpope/vim-surround'                                   " streamline surroundings workflow

" ---------------------------------------------------------------- NVIM PLUGINS

if has("nvim")
    Plug 'BurntSushi/ripgrep'                                   " Telescope dependency
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'                                     " lsp completion
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'                                    " lsp snippets
    Plug 'neovim/nvim-lspconfig'                                " lsp client configs
    Plug 'jose-elias-alvarez/null-ls.nvim'                      " in-memory language server for diagnostics & formatting
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'                 " integrates ESLint and file formatting with Prettier
    Plug 'nvim-lua/popup.nvim'                                  " overlay popups
    Plug 'nvim-lua/plenary.nvim'                                " Telescope dependency
    Plug 'nvim-telescope/telescope.nvim'                        " fuzzy finder over lists
    Plug 'nvim-telescope/telescope-fzy-native.nvim'             " native sorter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " better syntax highlighting
    Plug 'nvim-treesitter/playground'                           " playground for nvim-treesitter
    Plug 'sharkdp/fd'                                           " finder for telescope
    Plug 'simrat39/rust-tools.nvim'                             " config and tools for ls
    Plug 'SirVer/ultisnips'                                     " Utility snippets
    Plug 'windwp/nvim-autopairs'                                " autopairs
endif

" ---------------------------------------------------------------------- THEMES

Plug 'axvr/photon.vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'gruvbox-community/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'mcchrish/zenbones.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'

call plug#end()
