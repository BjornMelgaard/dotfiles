" word movements from vim-husk with _ delim perception
function! s:word_left()
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let nextnext = 1
  let i = 2
  while nextnext < pos
    let next = nextnext
    let nextnext = match(line, '\<\S\|\>\S\|_\|\s\zs\S\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat("\<Left>", pos - next)
endfunction

function! s:word_right()
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let i = 2
  while next <= pos && next > 0
    let next = match(line, '\<\S\|_\|\>\S\|\s\zs\S\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat("\<Right>", next - pos)
endfunction

cnoremap <expr> <M-u> <SID>word_left()
cnoremap <expr> <M-o> <SID>word_right()
