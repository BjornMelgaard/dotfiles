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

function! CloseWindowOrKillBuffer() "{{{
  " write
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  " never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction "}}}

function! DuplicateBlock() "{{{
  let existing_register_value = @0
  execute 'normal! gvy`>p'
  let @0 = existing_register_value
endfunction "}}}

" formatting shortcuts
nnoremap <leader>ref :call Preserve("normal gg=G")<CR>
nnoremap <leader>rt :call StripTrailingWhitespace()<CR>
nnoremap <leader>rr :retab<CR>

" eval vimscript by line or visual selection
nnoremap <silent> <leader>e :call Source(line('.'), line('.'))<CR>
vnoremap <silent> <leader>e :call Source(line('v'), line('.'))<CR>

nnoremap <M-D> :call Preserve("normal! yyp")<CR>
vnoremap <M-D> :<C-u>call DuplicateBlock()<CR>

" window killer
nnoremap <silent> <M-q> :call CloseWindowOrKillBuffer()<cr>
nnoremap <silent> Q :bd<cr>

autocmd BufWritePre * :call StripTrailingWhitespace()
