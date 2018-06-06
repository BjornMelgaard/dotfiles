autocmd FileType ruby nnoremap <buffer><silent> <leader>b O<C-r>=neosnippet#expand('pry')<CR><esc>=l


autocmd FileType javascript,typescript,vue nnoremap <buffer><silent> <leader>b Oconsole.log()<left>
autocmd FileType javascript,typescript,vue nnoremap <buffer><silent> <leader>B Odebugger<esc>


autocmd FileType elm nnoremap <buffer><silent> <leader>b ODebug.log "message" <esc>


autocmd FileType python nnoremap <buffer><silent> <leader>b Oimport sys; import pdb; pdb.Pdb(stdout=sys.__stdout__).set_trace()<esc>
