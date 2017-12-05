" rubocop autocorrect
nnoremap <buffer><silent> <leader>ru :w<cr>:!rubocop -a <c-r>=expand('%n')<cr> > /dev/null 2>&1<cr>:e<cr>

" add |
let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|': '|'}

" keys for rspec
nnoremap <buffer><localleader>r :call RunCurrentSpecFile()<CR>
nnoremap <buffer><localleader>s :call RunNearestSpec()<CR>
nnoremap <buffer><localleader>\ :call RunLastSpec()<CR>
nnoremap <buffer><localleader>a :call RunAllSpecs()<CR>

" convert assingment to let macros
nmap <buffer><leader>ca Ilet(<del>:<Esc>Ea)<Esc>lldWysgl{

" convert -> to lambda
nmap <buffer><leader>cl cf>lambda<esc>ww,dibbC{<del><space><Bar><C-R>+<Bar><esc>

nnoremap <buffer><leader>f :RspecAddFocus<CR>
nnoremap <buffer><leader>F :RspecRemoveFocus<CR>

" substitute(expand('%:t:r:r:r'), '\v%(^(.)|_(.))', '\u\1\u\2', 'g')
" expand('%:t:r:r:r')
