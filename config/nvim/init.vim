"  Sets
set colorcolumn=80                                  " 80 character guide rule
set completeopt=menuone,longest,noinsert,noselect   " text completion
set cursorline                                      " highlight current line
set expandtab
set exrc 			                                      " allow local vimrc
set hidden                                          " allow background unsaved buffers
set ignorecase
set number
set nobackup
set nohlsearch                                      " highlight doesn't persist after search
set noshowmode                                      " hide mode indicator
set noswapfile
set nowrap                                          " no line-wrapping
set relativenumber
set scrolloff=8
set sidescrolloff=12
set shiftwidth=2
set signcolumn=number
set smartcase
set tabstop=2 softtabstop=2
set undodir=~/.vim/undodir
set undofile
set updatetime=50
" -----------------------------------------------------------------------------

" Imports
runtime ./plug.vim

if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        runtime ./macos.vim
    endif
endif
" -----------------------------------------------------------------------------

" Theme
if exists("&termguicolors") && exists("&winblend")
    set pumblend=5                                      " pop up menu transparency
    set termguicolors                                   " allow true color
    set winblend=0                                      " window transparency
    " set background=light
    " colorscheme github_light
    colorscheme tender

    highlight Normal guibg=none
endif
" -----------------------------------------------------------------------------

" Filetypes
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md
" -----------------------------------------------------------------------------

" Customisations
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
let g:Hexokinase_highlighters=['backgroundfull']
let g:loaded_perl_provider=0
let g:svelte_preprocessor_tags = [
\ { 'name': 'ts', 'tag': 'script', 'as': 'typescript'}
\ ]
let g:svelte_preprocessors = ['ts']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

runtime ./maps.vim
" -----------------------------------------------------------------------------

" Terminal Colours
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" -----------------------------------------------------------------------------

" Autocommands
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
