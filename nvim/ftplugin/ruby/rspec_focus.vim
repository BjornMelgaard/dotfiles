function! s:remove_focus() abort
  normal! ?, focus: true
  normal! d2E
endfunction

function! s:add_focus() abort
  normal! ?\v^\W*(it|scenario|feature|context)
  normal! $Bhi, focus: true
endfunction

command! -buffer -nargs=0 RspecAddFocus call <SID>add_focus()
command! -buffer -nargs=0 RspecRemoveFocus call <SID>remove_focus()

