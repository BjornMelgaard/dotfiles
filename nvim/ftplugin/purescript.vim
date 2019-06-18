" Generate function template from a function signature on the current line
nmap <buffer><silent> <localleader>g :<C-U>PaddClause<CR>
" type annotation
nmap <buffer><silent> <localleader>at :<C-U>PaddType<CR>
" suggestion
nmap <buffer><silent> <localleader>ap :<C-U>Papply<CR>
" split case
nmap <buffer><silent> <localleader>s :<C-U>Pcase<CR>

" ?
nmap <buffer><silent> <localleader>ai :<C-U>PaddImportQualifications<CR>
nmap <buffer><silent> <localleader>i :<C-U>Pimport<CR>
" nmap <buffer><silent> <localleader>t :<C-U>PimportModule<CR>

nmap <buffer><silent> <localleader>s :<C-U>Pursuit<CR>
nmap <buffer><silent> <localleader>t :<C-U>Ptype<CR>
" nmap <buffer><silent> <localleader>t :call LanguageClient_textDocument_hover()<CR>

nnoremap <buffer><localleader>r :call LanguageClient_textDocument_rename()<CR>

" nmap <buffer><silent> <localleader>t :<C-U>Plist<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Pimports<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Pload<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Prebuild<CR>

nmap <buffer><silent> <C-]> :<C-U>Pgoto<CR>

" nmap <buffer><silent> <localleader>t :<C-U>Pcwd<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Pend<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Psearch<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Pstart<CR>
