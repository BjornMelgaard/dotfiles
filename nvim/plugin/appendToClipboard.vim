" clipboard actions
function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" TODO: bug on multilibe selection
function! s:append_to_clipboard() abort
  let sel = s:get_visual_selection()
  " let sel = shellescape(sel)
  let cmd = 'copyq eval "copyq: change(0, \"text/plain\", str(read(0)) + \"'.sel.'\")\n"'
  " let cmd = shellescape(cmd)
  call system(cmd)
endfunction

vnoremap Y :<C-u>call <SID>append_to_clipboard()<CR>
