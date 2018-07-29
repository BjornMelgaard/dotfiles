" Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

nnoremap <buffer><localleader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <buffer><localleader>t :call LanguageClient_textDocument_hover()<CR>
nnoremap <buffer> <C-]> :call LanguageClient_textDocument_definition()<CR>
