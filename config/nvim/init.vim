" Imports
runtime ./plug.vim
runtime ./sets.vim
runtime ./lets.vim
runtime ./maps.vim
runtime ./autocommands.vim
runtime ./colours.vim

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

" Colourschemes

" set background=light
" colorscheme github_light

colorscheme tender

highlight Normal guibg=none
" -----------------------------------------------------------------------------

" Lua Imports
lua require("lsp-config")
