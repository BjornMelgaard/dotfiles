nmap <buffer><silent> <localleader>t :GhcModType<CR>
nmap <buffer><silent> <localleader>q :GhcModTypeClear<CR>

nmap <buffer><silent> <localleader>i :GhcModTypeInsert<CR>
nmap <buffer><silent> <localleader>I :GhcModInfo<CR>

nmap <buffer><silent> <localleader>s :GhcModSplitFunCase<CR>
nmap <buffer><silent> <localleader>e :GhcModExpand<CR>
nmap <buffer><silent> <localleader>g :GhcModSigCodegen<CR>
nmap <buffer><silent> <localleader>c :GhcModCheck<CR>

augroup fmt-haskell
  autocmd!
  autocmd BufWritePre *.hs Neoformat
augroup END

