nnoremap <buffer><localleader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <buffer><localleader>t :call LanguageClient_textDocument_hover()<CR>

" substitute ctags goto
nnoremap <buffer> <C-]> :call LanguageClient_textDocument_definition()<CR>
