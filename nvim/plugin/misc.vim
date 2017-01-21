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
  wall
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

" formatting shortcuts
nmap <leader>fef :call Preserve("normal gg=G")<CR>
nmap <leader>ft :call StripTrailingWhitespace()<CR>

" eval vimscript by line or visual selection
nmap <silent> <leader>e :call Source(line('.'), line('.'))<CR>
vmap <silent> <leader>e :call Source(line('v'), line('.'))<CR>

" window killer
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<cr>

autocmd BufWritePre * :call StripTrailingWhitespace()