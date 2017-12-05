nnoremap <buffer><localleader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <buffer><localleader>t :call LanguageClient_textDocument_hover()<CR>

" substitute ctags goto
nnoremap <buffer> <C-]> :call LanguageClient_textDocument_definition()<CR>

" eslint fix
nnoremap <buffer><silent> <leader>ru :w<cr>:!npm run format:base <c-r>=expand('%n')<cr> > /dev/null 2>&1<cr>:e<cr>

nmap <silent> <localleader><localleader> ?function<cr>:noh<cr><Plug>(jsdoc)
