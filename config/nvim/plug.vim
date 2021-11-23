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
Plug 'tpope/vim-capslock'                                   " software capslock
Plug 'tpope/vim-commentary'                                 " comment stuff out
Plug 'tpope/vim-fugitive'                                   " git wrapper
Plug 'tpope/vim-sensible'                                   " useful defaults
Plug 'tpope/vim-surround'                                   " streamline surroundings workflow
Plug 'tpope/vim-vinegar'                                    " enhance Netrw

" ---------------------------------------------------------------- NVIM PLUGINS

if has("nvim")

    " -- Completion
    Plug 'hrsh7th/nvim-cmp'         " base completion
    Plug 'hrsh7th/cmp-buffer'       " complete words from the current buffer
    Plug 'hrsh7th/cmp-path'         " complete filepaths
    Plug 'hrsh7th/cmp-nvim-lua'     " complete neovim lua
    Plug 'hrsh7th/cmp-nvim-lsp'     " auto-import, snippet expansion etc
    Plug 'hrsh7th/cmp-cmdline'      " complete vim command line
    Plug 'L3MON4D3/LuaSnip'         " snippet completion
    Plug 'saadparwaiz1/cmp_luasnip' " snippet completion
    Plug 'onsails/lspkind-nvim'     " pictograms to completion

    " -- Telescope
    Plug 'BurntSushi/ripgrep'                                   " Telescope dependency
    Plug 'nvim-lua/plenary.nvim'                                " Telescope dependency
    Plug 'nvim-telescope/telescope.nvim'                        " fuzzy finder over lists
    Plug 'nvim-telescope/telescope-fzy-native.nvim'             " native sorter

    " Plug 'hrsh7th/vim-vsnip'                                    " lsp snippets
    Plug 'neovim/nvim-lspconfig'                                " lsp client configs
    Plug 'jose-elias-alvarez/null-ls.nvim'                      " in-memory language server for diagnostics & formatting
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'                 " integrates ESLint and file formatting with Prettier
    Plug 'nvim-lua/popup.nvim'                                  " overlay popups
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
Plug 'gosukiwi/vim-atom-dark'
Plug 'gruvbox-community/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'

call plug#end()
