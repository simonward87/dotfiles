" Imports
runtime ./plugin/plug.vim
runtime ./plugin/sets.vim
runtime ./plugin/lets.vim
runtime ./plugin/remaps.vim
runtime ./plugin/autocommands.vim
runtime ./plugin/colours.vim
runtime ./plugin/telescope.vim

if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        runtime ./macos.vim
    endif
endif
" -----------------------------------------------------------------------------

" Filetypes

au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" -----------------------------------------------------------------------------

" Colours
set background=light
colorscheme github_light
" -----------------------------------------------------------------------------

" LSP
lua require("lsp-config")
