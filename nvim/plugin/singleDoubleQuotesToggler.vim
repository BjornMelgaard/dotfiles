function! s:get_visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - 2]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" dependencies - tpope's surround.vim plugin
function! s:singleDoubleQuotesToggler() "{{{
  " select between "" using
  norm va"
  let doubleq_sel = s:get_visual_selection()
  " echo string(doubleq_sel)
  let doubleq_sel_length = strlen(doubleq_sel)
  echo string(doubleq_sel_length)
  exec "norm! \<Esc>"
  if doubleq_sel_length == 0
    " echo string("single")
    norm cs'"
  else
    " echo string('double')
    norm cs"'
  endif
endfunction "}}}

nnoremap <silent> GS :call <SID>singleDoubleQuotesToggler()<CR>
