function! neoformat#formatters#haskell#enabled() abort
  return ['stackstylishhaskell']
endfunction

function! neoformat#formatters#haskell#stackstylishhaskell() abort
    return {
        \ 'exe': 'stack exec stylish-haskell',
        \ 'args': ['2>/dev/null'],
        \ 'stdin': 1,
        \ }
endfunction
