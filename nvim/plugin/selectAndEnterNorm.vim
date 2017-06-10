function! s:SelectAndEnterNorm(...)
  silent exe "normal! '[V']"
  call feedkeys(":norm ")
endfunction

vnoremap <leader>. :norm<space>
nmap <silent> <leader>. :set opfunc=<SID>SelectAndEnterNorm<CR>g@
