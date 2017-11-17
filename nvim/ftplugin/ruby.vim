" my selenium and zeus toggler
let g:rspec_selenium = 0
let g:rspec_zeus = 0

function! ReloadRspecCommand() abort
  let g:rspec_command = 'call VimuxRunCommand("clear; CLIENT_PORT=$CLIENT_PORT_DEV '
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

nnoremap <buffer><leader>rtz :call ZeusToggle()<CR>
nnoremap <buffer><leader>rts :call SeleniumToggle()<CR>

" rubocop autocorrect
nnoremap <buffer><silent> <leader>ru :w<cr>:!rubocop -a <c-r>=expand('%n')<cr> > /dev/null 2>&1<cr>:e<cr>

" add |
let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|': '|'}

" keys for rspec
nnoremap <buffer><localleader>r :call RunCurrentSpecFile()<CR>
nnoremap <buffer><localleader>s :call RunNearestSpec()<CR>
nnoremap <buffer><localleader>\ :call RunLastSpec()<CR>
nnoremap <buffer><localleader>a :call RunAllSpecs()<CR>

" convert assingment to let macros
nmap <buffer><leader>ca Ilet(<del>:<Esc>Ea)<Esc>lldWysgl{

" convert -> to lambda
nmap <buffer><leader>cl cf>lambda<esc>ww,dibbC{<del><space><Bar><C-R>+<Bar><esc>

" mactos to add `focus: true` to last
nmap <buffer><leader>fc ?do<CR>hi,focus:<space>true<space><esc>
