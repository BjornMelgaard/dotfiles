" Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

nnoremap <buffer><localleader>g :call LanguageClient#textDocument_definition()<CR>
nnoremap <buffer><localleader>f :%!hindent<CR>:%!stylish-haskell<CR>:%!brittany<CR>
nnoremap <buffer><localleader>b :call LanguageClient#textDocument_references()<CR>
nnoremap <buffer><localleader>a :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <buffer><localleader>s :call LanguageClient#textDocument_documentSymbol()<CR>

nnoremap <buffer><localleader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <buffer><localleader>t :call LanguageClient_textDocument_hover()<CR>
nnoremap <buffer> <C-]> :call LanguageClient_textDocument_definition()<CR>
