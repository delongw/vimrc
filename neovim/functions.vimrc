
" ************************************
" selfdefine functions
" ************************************

" auto reload init.vim after modify
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
augroup END " }

" trim whitespace 
function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)
map <leader>w :FixWhitespace<CR>
