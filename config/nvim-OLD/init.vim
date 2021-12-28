"  Sets

set colorcolumn=80                                  " 80 character guide rule
set completeopt=menuone,longest,noinsert,noselect   " text completion
set cursorline                                      " highlight current line
set expandtab                                       " insert spaces for tabs
set exrc 			                                      " allow local vimrc
set hidden                                          " allow background unsaved buffers
set ic                                              " ignore case in search patterns
set iskeyword+=-                                    " treat split words as single words
set nu                                              " line numbers
set nobk                                            " stop autocreating backups
set nohlsearch                                      " highlight doesn't persist after search
set noshowmode                                      " hide mode indicator
set noswf                                           " stop autocreating swapfiles
set nowrap                                          " no line-wrapping
set rnu                                             " relative line numbers
set scrolloff=8                                     " vertical scroll boundaries
set sidescrolloff=12                                " horizontal scroll boundaries
set sw=2                                            " number of spaces to use for autoindent
set signcolumn=number                               " use line number column for signs
set smartcase                                       " smart case-insensitive search
set ts=2 sts=2                                      " number of spaces that a tab counts for
set undodir=~/.vim/undodir                          " directory for undo files
set undofile                                        " create undo files
set updatetime=50                                   " delay until swapfile is written

" -----------------------------------------------------------------------------
" Imports

runtime ./plug.vim

" Mac-specific config
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
    " colorscheme cake16
    colorscheme tender
    " colorscheme iceberg

    " highlight Normal guibg=none
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
let g:colors_off_a_little=1
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
