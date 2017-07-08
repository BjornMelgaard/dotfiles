" for classes
setlocal iskeyword+=-

fun! s:repair()
  normal! :%s:":':g
  normal! :%s:{\ze\S:{ :g
  normal! :%s:\S\zs}: }:g
endf

nnoremap <localleader>rh :call <SID>repair()<cr>
" vnoremap <localleader>rh :call <SID>repair()<cr>
