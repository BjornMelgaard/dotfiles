nnoremap <buffer><localleader>td :TSDoc<CR>
nnoremap <buffer><localleader>tf :TSDef<CR>

" 'yarn run test' in new window
nnoremap <buffer><localleader>\ :call VimuxRunCommand('clear; yrt')<CR>

" 'yarn run lint' in new window
" nnoremap <buffer><localleader>c :call VimuxRunCommand('clear; yrl')<CR>
nnoremap <buffer><localleader>c :call VimuxRunCommand('clear; tslint --project tsconfig.json --format verbose --type-check --config tslint.json')<CR>
