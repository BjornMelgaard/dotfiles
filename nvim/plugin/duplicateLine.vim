function! <SID>Preserve(command) "{{{
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

" duplicate line
nnoremap <C-M-d> :call <SID>Preserve("normal! yyp")<CR>
vnoremap <C-M-d> :copy '><CR>

