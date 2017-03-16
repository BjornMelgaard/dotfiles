let g:rspec_selenium = 1
let g:rspec_zeus = 0

function! ReloadRspecCommand() abort
  let g:rspec_command = 'call VimuxRunCommand("clear; '
  if g:rspec_selenium == 1
    let g:rspec_command .= 'RSPEC_SELENIUM=true '
  end
  if g:rspec_zeus == 1
    let g:rspec_command .= 'zeus '
  end
  let g:rspec_command .= 'rspec {spec}")'
endfunction

call ReloadRspecCommand()

function! SeleniumToggle() abort
  if g:rspec_selenium
      let g:rspec_selenium = 0
  else
      let g:rspec_selenium = 1
  endif
  call ReloadRspecCommand()
  echo g:rspec_command
endfunction

function! ZeusToggle() abort
  if g:rspec_zeus
      let g:rspec_zeus = 0
  else
      let g:rspec_zeus = 1
  endif
  call ReloadRspecCommand()
  echo g:rspec_command
endfunction

nnoremap <Leader>rtz :call ZeusToggle()<CR>
nnoremap <Leader>rts :call SeleniumToggle()<CR>
