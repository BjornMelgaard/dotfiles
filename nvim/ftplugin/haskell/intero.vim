" Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

" Background process and window management
nnoremap <silent> <localleader>is :InteroStart<CR>
nnoremap <silent> <localleader>ik :InteroKill<CR>

" Open intero/GHCi split horizontally
nnoremap <silent> <localleader>io :InteroOpen<CR>
" Open intero/GHCi split vertically
nnoremap <silent> <localleader>iov :InteroOpen<CR><C-W>H
nnoremap <silent> <localleader>ih :InteroHide<CR>

" Load individual modules
nnoremap <silent> <localleader>il :InteroLoadCurrentModule<CR>
nnoremap <silent> <localleader>if :InteroLoadCurrentFile<CR>

" Type-related information
" Heads up! These next two differ from the rest.
map <silent> <localleader>t <Plug>InteroGenericType
map <silent> <localleader>T <Plug>InteroType
nnoremap <silent> <localleader>it :InteroTypeInsert<CR>

" Navigation
nnoremap <silent> <localleader>jd :InteroGoToDef<CR>

" Managing targets
" Prompts you to enter targets (no silent):
nnoremap <localleader>ist :InteroSetTargets<SPACE>
