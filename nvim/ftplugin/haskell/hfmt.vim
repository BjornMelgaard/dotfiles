function! Hfmt() abort
  let path = expand('%:p')
  " installed with stack
  let format = '~/.local/bin/hfmt -w '
  call system(format . path)
  edit!
endfunction

nnoremap <silent> <localleader>fmt :call Hfmt()<CR>
