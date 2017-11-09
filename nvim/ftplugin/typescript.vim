nnoremap <buffer><localleader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <buffer><localleader>t :call LanguageClient_textDocument_hover()<CR>
nnoremap <buffer> <C-]> :call LanguageClient_textDocument_definition()<CR>

" nnoremap <buffer><localleader>t :TSDoc<CR>
" nnoremap <buffer> <C-]> :TSDef<CR>

" 'yarn run test' in new window
nnoremap <buffer><localleader>\ :call VimuxRunCommand('clear; yrt')<CR>

" 'yarn run lint' in new window
" nnoremap <buffer><localleader>c :call VimuxRunCommand('clear; yrl')<CR>
nnoremap <buffer><localleader>c :call VimuxRunCommand('clear; tslint --project tsconfig.json --format verbose --type-check --config tslint.json')<CR>

" surround with tYpe
let b:surround_{char2nr("y")} = "\1type: \1\<\r>"

" " Surround a word with treis()
" nmap <buffer> <Leader>tr ysiwftreis<CR>f(

" " Surround a visual selection with treis()
" vmap <buffer> <Leader>tr Sftreis<CR>f(

" nmap <buffer> <Leader>tR ysiwfrequire('treis')<CR>f(
" vmap <buffer> <Leader>tR Sfrequire('treis')<CR>f(
