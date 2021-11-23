nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>o :wincmd o<CR>

nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G push<CR>

" nnoremap <leader>pv :Ex<CR>
" nnoremap <leader>dtfs :Ex ~/.dotfiles<CR>

" function! ToggleSideEffects()
"     if mapcheck("dd", "n") == ""
"         noremap dd "_dd
"         noremap D "_D
"         noremap d "_d
"         noremap X "_X
"         noremap x "_x
"         echo 'side effects off'
"     else
"         unmap dd
"         unmap D
"         unmap d
"         unmap X
"         unmap x
"         echo 'side effects on'
"     endif
" endfunction

" nnoremap ,, :call ToggleSideEffects()<CR>
