" the only part that is changed is normal! anstead normal, cause it doestn
" work nice with ExchangeOperator
function s:Erase()
  let l = getline(".")
  let pos = col("'^") - 1

  " If we are at the start of the line this is a special case.
  if pos == 0
    if &backspace =~ 'eol' && line(".") > 1
      normal kgJ
      if l == ""
        startinsert!
      else
        startinsert
      endif
      return
    endif
    startinsert
    return
  endif

  " Start from character to the left of the cursor.
  let c = strpart(l, pos - 1, 1)
  " i would be a count of the characters that sould be erased.  From this
  " point on, one would be removed in any case.
  let i = 1
  if c !~ '\k'
    " Delete all the non word characters to the left
    while pos - i - 1 >= 0 && strpart(l, pos - i - 1, 1) !~ '\k'
      let i = i + 1
    endwhile
  else
    " Remove all the _
    if c == '_'
      while pos - i - 1 >= 0 && strpart(l, pos - i - 1, 1) == '_'
        let i = i + 1
      endwhile
    endif

    if pos - i - 1 >= 0 && strpart(l, pos - i - 1, 1) =~ '\k'
      let c = strpart(l, pos - i - 1, 1)
      " Regexps do not have a Unicode uppercase class, don't they?
      if tolower(c) !=# c
        while pos - i - 1 >= 0
          let c = strpart(l, pos - i - 1, 1)
          if c !~ '\k' || tolower(c) ==# c
            break
          endif
          let i = i + 1
        endwhile
      else
        while pos - i - 1 >= 0
          let c = strpart(l, pos - i - 1, 1)
          if c !~ '\k' || c == '_'
            break
          endif
          if tolower(c) !=# c
            let i = i + 1
            break
          endif
          let i = i + 1
        endwhile
      endif
    endif
  endif

  if i > 1
    let i = i - 1
    exec "normal! " . i . "Xx"
  else
    exec "normal! x"
  endif

  if pos == strlen(l)
    startinsert!
  else
    startinsert
  endif

endfunction


let g:EraseSubword_insertMap = "<C-W>"

execute "inoremap <silent> <unique> " . g:EraseSubword_insertMap . " <Esc>:call <SID>Erase()<CR>"
