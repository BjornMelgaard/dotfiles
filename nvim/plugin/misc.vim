function! Source(begin, end) "{{{
  let lines = getline(a:begin, a:end)
  for line in lines
    execute line
  endfor
endfunction "}}}

function! Preserve(command) "{{{
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  execute a:command
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction "}}}

function! StripTrailingWhitespace() "{{{
  call Preserve("%s/\\s\\+$//e")
endfunction "}}}

" formatting shortcuts
nnoremap <leader>rw :call StripTrailingWhitespace()<CR>
nnoremap <leader>rt :retab<CR>

" eval vimscript by line or visual selection
nnoremap <silent> <leader>e :call Source(line('.'), line('.'))<CR>
vnoremap <silent> <leader>e :call Source(line('v'), line('.'))<CR>

" dublicate line
nnoremap <C-M-d> :call Preserve("normal! yyp")<CR>
vnoremap <C-M-d> :copy '><CR>

autocmd BufWritePre * :call StripTrailingWhitespace()
