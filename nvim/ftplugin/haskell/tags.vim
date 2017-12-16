" if executable('hasktags') == 1
"   nnoremap <buffer> <localleader>tag :!hasktags -c .<CR><CR>
" endif

if executable('hothasktags') == 1
  " haskell specific keyword settings
  " especially useful for 'hothasktags'
  setl iskeyword=a-z,A-Z,_,.,39

  nnoremap <buffer> <localleader>tag :!hothasktags `find . -iname "*.hs"` > tags<CR><CR>
endif
