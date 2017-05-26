autocmd FileType ruby       nnoremap <buffer><silent> <leader>b O<C-r>=neosnippet#expand('pry')<CR><esc>=l
autocmd FileType typescript nnoremap <buffer><silent> <leader>b Oconsole.log()<left>

