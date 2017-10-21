" GhcMod {{{
nmap <buffer><silent> <localleader>t :GhcModType<CR>
nmap <buffer><silent> <localleader>q :GhcModTypeClear<CR>

nmap <buffer><silent> <localleader>i :GhcModTypeInsert<CR>
nmap <buffer><silent> <localleader>I :GhcModInfo<CR>

nmap <buffer><silent> <localleader>s :GhcModSplitFunCase<CR>

" Display the expansion of splices in quickfix.
nmap <buffer><silent> <localleader>e :GhcModExpand<CR>

nmap <buffer><silent> <localleader>g :GhcModSigCodegen<CR>
nmap <buffer><silent> <localleader>c :GhcModCheck<CR>
" }}}

" Hoogle {{{
" Hoogle the word under the cursor
nnoremap <silent> <localleader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <localleader>hH :Hoogle

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <localleader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <localleader>hI :HoogleInfo

" Hoogle, close the Hoogle window
nnoremap <silent> <localleader>hz :HoogleClose<CR>
" }}}

" Tags {{{
" if executable('hasktags') == 1
"   nnoremap <buffer> <localleader>tag :!hasktags -c .<CR><CR>
" endif

if executable('hothasktags') == 1
  " haskell specific keyword settings
  " especially useful for 'hothasktags'
  setl iskeyword=a-z,A-Z,_,.,39

  nnoremap <buffer> <localleader>tag :!hothasktags `find . -iname "*.hs"` > tags<CR><CR>
endif
" }}}

" yank selected text inside :{\n<text>\n:}, ready to paste to ghci
vmap <buffer><silent> <localleader>y ,nr0<C-v>wh100jdO:{<esc>gjo<c-u>:}<esc>gg"*yG:<C-u>q!<CR>
