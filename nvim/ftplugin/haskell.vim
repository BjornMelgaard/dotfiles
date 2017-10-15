nmap <buffer><silent> <localleader>t :GhcModType<CR>
nmap <buffer><silent> <localleader>q :GhcModTypeClear<CR>

nmap <buffer><silent> <localleader>i :GhcModTypeInsert<CR>
nmap <buffer><silent> <localleader>I :GhcModInfo<CR>

nmap <buffer><silent> <localleader>s :GhcModSplitFunCase<CR>

" Display the expansion of splices in quickfix.
nmap <buffer><silent> <localleader>e :GhcModExpand<CR>

nmap <buffer><silent> <localleader>g :GhcModSigCodegen<CR>
nmap <buffer><silent> <localleader>c :GhcModCheck<CR>

augroup fmt-haskell
  autocmd!
  autocmd BufWritePre *.hs Neoformat
augroup END

" if executable('hasktags') == 1
"   nnoremap <buffer> <leader>tag :!hasktags -c .<CR><CR>
" endif

if executable('hothasktags') == 1
  " haskell specific keyword settings
  " especially useful for 'hothasktags'
  setl iskeyword=a-z,A-Z,_,.,39

  nnoremap <buffer> <leader>tag :!hothasktags `find . -iname "*.hs"` > tags<CR><CR>
endif

