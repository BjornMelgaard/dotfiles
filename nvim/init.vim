" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Initialize defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setup & dein {{{
  set rtp+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
  call dein#begin(expand('~/.config/nvim/bundle/'))
  call dein#add('Shougo/dein.vim')
"}}}

let s:cache_dir = '~/.config/nvim/.cache'
let s:settings = {}
let s:settings.default_indent = 2
let s:settings.max_column = 120

" helper functions
function! s:get_cache_dir(suffix) "{{{
  return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction "}}}

function! EnsureExists(path) "{{{
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction "}}}

" swap files
let &directory = s:get_cache_dir('swap')
set noswapfile

call EnsureExists(s:cache_dir)
call EnsureExists(&directory)

if !executable('ag')
  echoerr('You must install silver searcher')
endif

" base configuration
set showfulltag
set shell=/bin/zsh
set noshelltemp                                     "use pipes
set clipboard=unnamed
set inccommand=nosplit
set undofile
" set paste

" whitespace
set expandtab                                       "spaces instead of tabs
let &tabstop=s:settings.default_indent              "number of spaces per tab for display
let &softtabstop=s:settings.default_indent          "number of spaces per tab in insert mode
let &shiftwidth=s:settings.default_indent           "number of spaces when indenting
set list                                            "highlight whitespace
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮,space:·
set shiftround
set linebreak
let &showbreak='↪ '

set wildmode=list:full
set wildignorecase

set splitbelow
set splitright

" searching
set ignorecase                                      "ignore case for searching
set smartcase                                       "do case-sensitive if there's a capital letter
set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
set grepformat=%f:%l:%c:%m

let mapleader = ","
let g:mapleader = ","

" ui configuration
set showmatch                                       "automatically highlight matching braces/brackets/etc.
set matchtime=2                                     "tens of a second to show matching parentheses
set number
set lazyredraw
set noshowmode
set foldmethod=syntax                               "fold via syntax of files
set foldlevelstart=99                               "open all folds by default
let g:xml_syntax_folding=1                          "enable xml folding
set completeopt-=preview

set cursorline
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline
let &colorcolumn=s:settings.max_column

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Core
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('vim-scripts/matchit.zip')
call dein#add('vim-airline/vim-airline') "{{{
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '¦'
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#syntastic#enabled = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
"}}}
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-unimpaired') "{{{
  nmap <c-up> [e
  nmap <c-down> ]e
  vmap <c-up> [egv
  vmap <c-down> ]egv
"}}}
" call dein#add('qpkorr/vim-bufkill')
call dein#add('mhinz/vim-startify') "{{{
  let g:startify_session_dir = s:get_cache_dir('sessions')
  let g:startify_change_to_vcs_root = 1
  let g:startify_show_sessions = 1
  let g:startify_session_before_save = [
      \ 'tabdo NERDTreeClose'
      \ ]
  let g:startify_disable_at_vimenter = 1

  autocmd VimEnter * nested
    \   if !argc()
    \ |   silent! execute ":SLoad " . fnamemodify(getcwd(), ':t')
    \ |   redraw!
    \ | endif

  nnoremap <F1> :Startify<cr>
  nnoremap <leader>S :SSave <C-R>=fnamemodify(getcwd(), ':t')<cr><cr>
"}}}
call dein#add('neomake/neomake') " {{{
  autocmd! BufWritePost * Neomake
  let g:neomake_open_list = 0
  " let g:neomake_verbose = 3
" }}}
call dein#add('zhaocai/GoldenView.Vim', {'on_map':['<Plug>ToggleGoldenViewAutoResize']}) "{{{
  let g:goldenview__enable_default_mapping=0
"}}}
call dein#add('jszakmeister/vim-togglecursor')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Web
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('groenewege/vim-less', {'on_ft':['less']})
call dein#add('cakebaker/scss-syntax.vim', {'on_ft':['scss','sass']})
call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss','sass']})
call dein#add('othree/html5.vim', {'on_ft':['html']})
call dein#add('digitaltoad/vim-jade', {'on_ft':['jade']})
call dein#add('mustache/vim-mustache-handlebars', {'on_ft':['mustache','handlebars']})
call dein#add('gregsexton/MatchTag', {'on_ft':['html','xml']})
call dein#add('mattn/emmet-vim', {'on_ft':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache','handlebars']})
autocmd FileType html,xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><c-y><c-y> <c-y>,
autocmd FileType html,xml,xsl,xslt,xsd,css,sass,scss,less,mustache vmap <buffer><c-y><c-y> <c-y>,

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('marijnh/tern_for_vim', {
      \ 'on_ft': 'javascript',
      \ 'build': 'npm install'
      \ })
call dein#add('pangloss/vim-javascript', {'on_ft':['javascript']})
call dein#add('maksimr/vim-jsbeautify', {'on_ft':['javascript']}) "{{{
  nnoremap <leader>rjs :call JsBeautify()<cr>
"}}}
call dein#add('kchmck/vim-coffee-script', {'on_ft':['coffee']})
call dein#add('mmalecki/vim-node.js', {'on_ft':['javascript']})
call dein#add('leshill/vim-json', {'on_ft':['javascript','json']})
call dein#add('othree/javascript-libraries-syntax.vim', {'on_ft':['javascript','coffee','ls','typescript']})

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-bundler')
call dein#add('rhysd/vim-textobj-ruby')
call dein#add('fishbullet/deoplete-ruby')

let g:neomake_ruby_enabled_makers = ['rubocop']

" rubocop autocorrect
autocmd FileType ruby nnoremap <leader>ru :w<cr>:!rubocop -a <c-r>=expand('%n')<cr> > /dev/null 2>&1<cr>:e<cr>

" breakpoint
autocmd FileType ruby nnoremap <silent> <leader>b O<C-r>=neosnippet#expand('pry')<CR><esc>=l

" autoclose |
autocmd FileType ruby let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|': '|'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => C#
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call dein#add('Robzz/deoplete-omnisharp')
" call dein#add('OmniSharp/omnisharp-vim')
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.cs = 'OmniSharp#Complete'

autocmd FileType cs setlocal commentstring=//\ %s
autocmd FileType cs setlocal noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive') "{{{
  nnoremap <silent> <leader>ga :Git add --all<CR>
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gr :Gremove<CR>
  autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Typescript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('mhartington/nvim-typescript')
call dein#add('leafgarland/typescript-vim')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call dein#add('rafi/vim-tagabana')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neosnippet') " {{{
  set conceallevel=2 concealcursor=niv
  let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)

  inoremap <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  snoremap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" }}}

call dein#add('Shougo/deoplete.nvim') " {{{
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 150
" }}}
call dein#add('Shougo/echodoc.vim') " {{{
  set cmdheight=2
  let g:echodoc_enable_at_startup = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('tpope/vim-dispatch') " {{{
  " call dein#add('radenling/vim-dispatch-neovim')
  nnoremap <leader>rd :Dispatch<space>
  nnoremap <leader>rD :Copen<CR>

  " open file under cursor in window above
  nmap <leader>gf yif<C-k>:e <M-p><CR>
" }}}

if $TMUX != ''
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('wellle/tmux-complete.vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('benmills/vimux') " {{{
    let g:VimuxRunnerType = "window"

    nnoremap <leader>vt :VimuxTogglePane<CR>
  " }}}

  call dein#add('thoughtbot/vim-rspec') " {{{
    nnoremap \r :call RunCurrentSpecFile()<CR>
    nnoremap \s :call RunNearestSpec()<CR>
    nnoremap \\ :call RunLastSpec()<CR>
    nnoremap \a :call RunAllSpecs()<CR>
  " }}}

  " tmux status line
  autocmd VimEnter * silent! !tmux source ~/.config/dotfiles/tmux/themes/jellybeans_tmuxline
  autocmd VimLeave * silent! !tmux source ~/.config/dotfiles/tmux/themes/iceberg_tmuxline

  " call dein#add('edkolev/tmuxline.vim') " {{{
  "   let g:tmuxline_theme = 'jellybeans'
  "   let g:tmuxline_preset = 'minimal'
  " " }}}
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('editorconfig/editorconfig-vim', {'on_i':1})
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-speeddating')
call dein#add('thinca/vim-visualstar')
call dein#add('tpope/vim-commentary')
call dein#add('terryma/vim-expand-region')
call dein#add('chrisbra/NrrwRgn')
call dein#add('jiangmiao/auto-pairs') "{{{
  let g:AutoPairsShortcutToggle = ''
  let g:AutoPairsMapCh = 0
"}}}
call dein#add('justinmk/vim-sneak') "{{{
  let g:sneak#streak = 1
"}}}
call dein#add('tommcdo/vim-exchange')
call dein#add('junegunn/vim-easy-align') " {{{
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
" }}}
call dein#add('vim-scripts/ExtractMatches',{'depends':['vim-scripts/ingo-library','vim-scripts/PatternsOnText']}) " {{{
  call dein#add('vim-scripts/ingo-library')
  call dein#add('vim-scripts/PatternsOnText')

  function! s:digestLastSearch() "{{{
    let temp = substitute(@/, '\\zs', '(', '')
    return substitute(temp, '\\ze', ')', '')
  endfunction "}}}

  nnoremap ym :%YankMatches:<c-r>=<SID>digestLastSearch()<cr>::+<left><left>
  vnoremap ym :YankMatches:<c-r>=<SID>digestLastSearch()<cr>::+<left><left>

  nnoremap yM :%PrintMatches:<c-r>=<SID>digestLastSearch()<cr>:<left>
  vnoremap yM :PrintMatches:<c-r>=<SID>digestLastSearch()<cr>:<left>

  nnoremap dm :%s:::g<left><left><left>
  vnoremap dm :s:::g<left><left><left>
" }}}
call dein#add('bkad/CamelCaseMotion') " {{{
  map <silent> w <Plug>CamelCaseMotion_w
  map <silent> b <Plug>CamelCaseMotion_b
  map <silent> e <Plug>CamelCaseMotion_e
  map <silent> ge <Plug>CamelCaseMotion_ge
  sunmap w
  sunmap b
  sunmap e
  sunmap ge
" }}}
call dein#add('vim-scripts/eraseSubword') " {{{
  let g:EraseSubword_insertMap = "<C-w>"
" }}}
call dein#add('jeetsukumaran/vim-indentwise')
call dein#add('AndrewRadev/splitjoin.vim')

" nelstrom's Visual line repeat {{{
  xnoremap . :normal .<CR>
  xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

  function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
  endfunction
" }}}
call dein#add('sbdchd/neoformat')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('mileszs/ack.vim') "{{{
  let g:ackprg = "ag --nogroup --column --smart-case --follow"
"}}}
call dein#add('mbbill/undotree', {'on_cmd':'UndotreeToggle'}) "{{{
  let g:undotree_SplitLocation='botright'
  let g:undotree_SetFocusWhenToggle=1
  nnoremap <silent> <F5> :UndotreeToggle<CR>
"}}}
call dein#add('dkprice/vim-easygrep') "{{{
  let g:EasyGrepRecursive=1
  let g:EasyGrepAllOptionsInExplorer=1
  let g:EasyGrepCommand=1
  nnoremap <leader>vo :GrepOptions<cr>
"}}}
call dein#add('scrooloose/nerdtree', {'on_cmd':['NERDTreeToggle','NERDTreeFind']}) "{{{
  let NERDTreeShowHidden=1
  let NERDTreeQuitOnOpen=0
  let NERDTreeShowLineNumbers=1
  let NERDTreeChDirMode=0
  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.git$','\.hg$']
  let NERDTreeBookmarksFile=s:get_cache_dir('NERDTreeBookmarks')

  " disable f and F in privilege of find commands
  let g:NERDTreeMapToggleFiles=''
  let g:NERDTreeMapToggleFilters=''

  let g:NERDTreeMapQuit='Q'
  nnoremap <F2> :NERDTreeToggle<CR>
  nnoremap <F3> :NERDTreeFind<CR>
"}}}

call dein#add('bramblex/ranger.vim', { 'depends': 'rbgrouleff/bclose.vim' }) " {{{
  let g:ranger_path='SHELL=/home/bjorn/.config/ranger/rshell ranger --cmd "set colorscheme snow"'
" }}}
call dein#add('majutsushi/tagbar', {'on_cmd':'TagbarToggle'}) "{{{
  nnoremap <silent> <F9> :TagbarToggle<CR>
"}}}
call dein#add('kshenoy/vim-signature')
call dein#add('myusuf3/numbers.vim') " {{{
  nnoremap <silent> <F7> :NumbersToggle<cr>
" }}}

call dein#add('rhysd/clever-f.vim')
let g:clever_f_timeout_ms = 1 " make clever_f unclever

call dein#add('mhinz/vim-sayonara') " {{{
  let g:sayonara_confirm_quit = 1

  nnoremap Q :Sayonara<cr>
  nnoremap <M-q> :Sayonara!<cr>

  " nnoremap <silent> <M-q> <C-w>c
  " nnoremap <silent> <M-Q> :bd<cr>

  nnoremap <leader>q :xa<cr>
  nnoremap <leader>z :qa!<cr>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call dein#add('Shougo/denite.nvim') " {{{
  call denite#custom#var('file_rec', 'command', ['ag', '--vimgrep', '--hidden',
    \ '--ignore', '.hg',
    \ '--ignore', '.svn',
    \ '--ignore', '.git',
    \ '--ignore', '.bzr',
    \ '--ignore', '.cache'])
  call denite#custom#map('normal', 'Q', '<denite:quit>', 'noremap')
" }}}
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/junkfile.vim') " {{{
  let g:junkfile#directory=s:get_cache_dir('junk')
  command! -nargs=0 JunkfileTodo call junkfile#open_immediately('todo.md')
" }}}

nmap <space> [denite]
nnoremap [denite] <nop>

nnoremap <silent> [denite]l :<C-u>Denite line<cr>
nnoremap <silent> [denite]m :<C-u>Denite file_mru <cr>
nnoremap <silent> [denite]b :<C-u>Denite buffer<cr>
nnoremap <silent> [denite]j :<C-u>JunkfileTodo<cr>
nnoremap <silent> [denite]y :<C-u>Denite neoyank<cr>

" git project nav {{{
  call denite#custom#alias('source', 'file_rec/git', 'file_rec')
  call denite#custom#var('file_rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])
  nnoremap <silent> [denite]<space> :<C-u>Denite `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Textobj
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-indent')
call dein#add('kana/vim-textobj-entire')
call dein#add('lucapette/vim-textobj-underscore')
call dein#add('beloglazov/vim-textobj-quotes')
call dein#add('kana/vim-textobj-line')
call dein#add('jasonlong/vim-textobj-css')
call dein#add('b4winckler/vim-angry')
call dein#add('saihoooooooo/vim-textobj-space')

" file text object
call textobj#user#plugin('file', {
  \ 'file': {
  \ 'pattern': '\f\+', 'select': ['af', 'if']
  \ }
  \ })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('kana/vim-vspec') " Testing framework
call dein#add('tpope/vim-scriptease', {'on_ft':['vim']})
call dein#add('tpope/vim-markdown',{'on_ft':['markdown']})
if executable('instant-markdown-d')
  call dein#add('suan/vim-instant-markdown', {'on_ft':['markdown']})
endif
call dein#add('PotatoesMaster/i3-vim-syntax')
call dein#add('takac/vim-hardtime') " {{{
  " let g:hardtime_default_on = 1
" }}}
call dein#add('itchyny/vim-cursorword')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:SelectAndEnterNorm(...)
  silent exe "normal! '[V']"
  call feedkeys(":norm ")
endfunction

vnoremap <leader>. :norm<space>
nmap <silent> <leader>. :set opfunc=<SID>SelectAndEnterNorm<CR>g@

nnoremap <M-8> #

nnoremap <leader>w :w<cr>
nnoremap <leader>tag :!ctags -R .<cr>

" toggle paste
nnoremap <F6> :set invpaste<CR>:set paste?<CR>

" remap arrow keys
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>

" unimpaired tabs
nnoremap ]w :tabnext<CR>
nnoremap [w :tabprev<CR>

" quick resizing
nnoremap <M-h> <C-w>3<
nnoremap <M-l> <C-w>3>
nnoremap <M-j> <C-w>3-
nnoremap <M-k> <C-w>3+

" change cursor position in command mode
cnoremap <M-h> <left>
cnoremap <M-l> <right>
cnoremap <M-j> <down>
cnoremap <M-k> <up>

" will be rewritten if tmux run
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" kakoune like movements
noremap gh 0
noremap gi ^
noremap gl g_

nnoremap gj G
nnoremap gk gg

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

inoremap <C-r> <C-r><C-p>
inoremap <M-p> <C-r><C-p>+
cnoremap <M-p> <C-r>+

nnoremap p "+p
vnoremap p "+p
nnoremap <M-p> p
vnoremap <M-p> p

nnoremap P "+P
vnoremap P "+P
nnoremap <M-P> P
vnoremap <M-P> P

nnoremap y "+y
vnoremap y "+y
nnoremap <M-y> y
vnoremap <M-y> y

nnoremap Y "+y$
vnoremap Y :<C-u>call <SID>append_to_clipboard()<CR>
nnoremap <M-Y> y$
vnoremap <M-Y> y$

nnoremap ,d "+d
vnoremap ,d "+d
nnoremap ,D "+D
vnoremap ,D "+D

" deleting
inoremap <C-u> <C-g>u<C-u>
inoremap <C-d> <Del>

" sane regex
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
" nnoremap :s/ :s/\v

" command-line window
nnoremap q: q:i
nnoremap q/ q/i
nnoremap q? q?i

" folds
nnoremap zr zr:echo &foldlevel<cr>
nnoremap zm zm:echo &foldlevel<cr>
nnoremap zR zR:echo &foldlevel<cr>
nnoremap zM zM:echo &foldlevel<cr>

" screen line scroll
nnoremap <silent> j gj
nnoremap <silent> k gk

" auto center
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" reselect last paste
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" shortcuts for windows
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <leader>vsa :vert sba<cr>

" tab shortcuts
nnoremap <leader>tn :tab spl<CR>
nnoremap <leader>tc :tabclose<CR>

" quick buffer open
nnoremap gb :ls<cr>:e #

" general
nnoremap <leader>l :set list! list?<cr>
nnoremap <bs> :noh<cr>
nnoremap <M-v> vg_

nnoremap <C-s> <C-a>
nnoremap <leader>R :so $MYVIMRC<CR>

" in nvim terminal emulator
tnoremap <C-\><C-\> <C-\><C-n>
tnoremap <left> <C-\><C-n>:bprev<CR>
tnoremap <right> <C-\><C-n>:bnext<CR>
tnoremap <up> <C-\><C-n>:tabnext<CR>
tnoremap <down> <C-\><C-n>:tabprev<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Finish
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('nanotech/jellybeans.vim')

call dein#end()

if dein#check_install()
  call dein#install()
endif

autocmd VimEnter * call dein#call_hook('post_source')

filetype plugin indent on
syntax enable
colorscheme jellybeans

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" go back to previous position of cursor if any
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \  exe 'normal! g`"zvzz' |
  \ endif

" autosave
autocmd FocusLost * silent! wall
set autowriteall

let neosimpp_path = '~/.config/nvim/bundle/repos/github.com/Shougo/neosnippet-snippets/neosnippets/'
exec "au BufNewFile,BufRead Gemfile NeoSnippetSource ".neosimpp_path."Gemfile.snip"
exec "au BufNewFile,BufRead *.rb NeoSnippetSource ".neosimpp_path."rails.snip"

autocmd BufRead,BufNewFile *.conf setf dosini

autocmd FileType css,scss setlocal foldmethod=marker foldmarker={,}
autocmd FileType python setlocal foldmethod=indent
autocmd FileType markdown setlocal nolist
autocmd FileType vim setlocal fdm=indent keywordprg=:help
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2

" vim-commentary
xmap #  <Plug>Commentary
omap #  <Plug>Commentary
nmap # <Plug>CommentaryLine

" kakoune like find
nmap <M-.> <Plug>(clever-f-repeat-forward)
xmap <M-.> <Plug>(clever-f-repeat-forward)
omap <M-.> <Plug>(clever-f-repeat-forward)
nmap <M->> <Plug>(clever-f-repeat-back)
xmap <M->> <Plug>(clever-f-repeat-back)
omap <M->> <Plug>(clever-f-repeat-back)
