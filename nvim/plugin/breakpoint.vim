autocmd FileType ruby       nnoremap <buffer><silent> <leader>b O<C-r>=neosnippet#expand('pry')<CR><esc>=l
autocmd FileType js,typescript nnoremap <buffer><silent> <leader>b Oconsole.log()<left>
autocmd FileType elm nnoremap <buffer><silent> <leader>b iDebug.log "message" <esc>

