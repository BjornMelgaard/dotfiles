" for classes
setlocal iskeyword+=-

fun! s:repair()
  normal! :%s:":':g
  normal! :%s:{\ze\S:{ :g
  normal! :%s:\S\zs}: }:g
endf

nnoremap <leader>rh :call <SID>repair()<cr>
" vnoremap <leader>rh :call <SID>repair()<cr>
