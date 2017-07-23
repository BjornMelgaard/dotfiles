setlocal fdm=indent keywordprg=:help

" eval vimscript by line or visual selection
nnoremap <buffer><silent> <leader>e :call Source(line('.'), line('.'))<CR>
vnoremap <buffer><silent> <leader>e :call Source(line('v'), line('.'))<CR>
