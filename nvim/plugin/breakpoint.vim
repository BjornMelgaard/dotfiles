autocmd FileType ruby       nnoremap <buffer><silent> <leader>b O<C-r>=neosnippet#expand('pry')<CR><esc>=l
autocmd FileType javascript,typescript,vue nnoremap <buffer><silent> <leader>b Oconsole.log()<left>
autocmd FileType javascript,typescript,vue nnoremap <buffer><silent> <leader>B Odebugger<esc>
autocmd FileType elm nnoremap <buffer><silent> <leader>b iDebug.log "message" <esc>

