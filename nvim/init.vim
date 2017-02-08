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
" set noswapfile

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
call dein#add('qpkorr/vim-bufkill')
call dein#add('mhinz/vim-startify') "{{{
  let g:startify_session_dir = s:get_cache_dir('sessions')
  let g:startify_change_to_vcs_root = 1
  let g:startify_show_sessions = 1
  nnoremap <F1> :Startify<cr>
"}}}
call dein#add('neomake/neomake') " {{{
  autocmd! BufWritePost * Neomake
  let g:neomake_ruby_enabled_makers = ['rubocop']
  " let g:neomake_verbose = 3
" }}}
call dein#add('zhaocai/GoldenView.Vim', {'on_map':['<Plug>ToggleGoldenViewAutoResize']}) "{{{
  let g:goldenview__enable_default_mapping=0
  nmap <F4> <Plug>ToggleGoldenViewAutoResize
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
call dein#add('mattn/emmet-vim', {'on_ft':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache','handlebars']}) "{{{
  autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><c-y><c-y> <c-y>,
  autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache vmap <buffer><c-y><c-y> <c-y>,
"}}}

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
call dein#add('leafgarland/typescript-vim', {'on_ft':['typescript']})
call dein#add('kchmck/vim-coffee-script', {'on_ft':['coffee']})
call dein#add('mmalecki/vim-node.js', {'on_ft':['javascript']})
call dein#add('leshill/vim-json', {'on_ft':['javascript','json']})
call dein#add('othree/javascript-libraries-syntax.vim', {'on_ft':['javascript','coffee','ls','typescript']})

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-bundler')
call dein#add('nelstrom/vim-textobj-rubyblock') " {{{
  let g:textobj_ruby_more_mappings = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('klen/python-mode', {'on_ft':['python']}) "{{{
  let g:pymode_rope=0
"}}}
call dein#add('davidhalter/jedi-vim', {'on_ft':['python']}) "{{{
  let g:jedi#popup_on_dot=0
"}}}

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
" => Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neosnippet') " {{{
  set conceallevel=2 concealcursor=niv
  let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)

  imap <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" }}}

call dein#add('Shougo/deoplete.nvim') " {{{
  call dein#add('fishbullet/deoplete-ruby')
  let g:deoplete#enable_at_startup = 1
" }}}

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

  nnoremap dm :%s:::
  vnoremap dm :s:::
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

  " omap <silent> iw <Plug>CamelCaseMotion_iw
  " xmap <silent> iw <Plug>CamelCaseMotion_iw
  " omap <silent> ib <Plug>CamelCaseMotion_ib
  " xmap <silent> ib <Plug>CamelCaseMotion_ib
  " omap <silent> ie <Plug>CamelCaseMotion_ie
  " xmap <silent> ie <Plug>CamelCaseMotion_ie
" }}}
call dein#add('vim-scripts/eraseSubword') " {{{
  let g:EraseSubword_insertMap = "<C-w>"
" }}}
call dein#add('jeetsukumaran/vim-indentwise')
call dein#add('AndrewRadev/splitjoin.vim')

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
  let NERDTreeIgnore=['\.git','\.hg']
  let NERDTreeBookmarksFile=s:get_cache_dir('NERDTreeBookmarks')
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
call dein#add('Shougo/deol.nvim')
call dein#add('Shougo/junkfile.vim') " {{{
  let g:junkfile#directory=s:get_cache_dir('junk')
  command! -nargs=0 JunkfileTodo call junkfile#open_immediately('todo.md')
" }}}

nmap <space> [denite]
nnoremap [denite] <nop>

" nnoremap [ctrlp]t :CtrlPBufTag<cr>
" nnoremap [ctrlp]T :CtrlPTag<cr>
nnoremap <silent> [denite]l :<C-u>Denite line<cr>
" nnoremap [ctrlp]o :CtrlPFunky<cr> " functions TODO
nnoremap <silent> [denite]f :<C-u>Denite file_mru <cr>
nnoremap <silent> [denite]b :<C-u>Denite buffer<cr>
nnoremap <silent> [denite]j :<C-u>JunkfileTodo<cr>
nnoremap <silent> [denite]y :<C-u>Denite neoyank<cr>
nnoremap <silent> [denite]t :<C-u>Deol<cr>
nnoremap <silent> [denite]T :<C-u>terminal<cr>

" git project nav {{{
  call denite#custom#alias('source', 'file_rec/git', 'file_rec')
  call denite#custom#var('file_rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])
  nnoremap <silent> [denite]p :<C-u>Denite `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
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
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <leader>s :sort<cr>

nnoremap <leader>w :w<cr>

" toggle paste
nnoremap <F6> :set invpaste<CR>:set paste?<CR>

" remap arrow keys
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>

" change cursor position in insert and command mode
inoremap <M-u> <C-left>
inoremap <M-o> <C-right>
inoremap <M-h> <left>
inoremap <M-l> <right>
inoremap <M-j> <down>
inoremap <M-k> <up>

cnoremap <M-u> <C-left>
cnoremap <M-o> <C-right>
cnoremap <M-h> <left>
cnoremap <M-l> <right>
cnoremap <M-j> <down>
cnoremap <M-k> <up>

" make Y consistent with C and D. See :help Y.
" nnoremap Y y$

" line movement like in kakoune
nnoremap gh ^
nnoremap gl $
vnoremap gh ^
vnoremap gl $
onoremap gh ^
onoremap gl $

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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tab shortcuts
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

" quick buffer open
nnoremap gb :ls<cr>:e #

" general
nnoremap <leader>l :set list! list?<cr>
nnoremap <BS> :noh<cr>
nnoremap <M-v> vg_

" in nvim terminal emulator
tnoremap <C-\><C-\> <C-\><C-n>
tnoremap <left> <C-\><C-n>:bprev<CR>
tnoremap <right> :<C-\><C-n>bnext<CR>
tnoremap <up> :<C-\><C-n>tabnext<CR>
tnoremap <down> :<C-\><C-n>tabprev<CR>

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

" autocmd FileType css,scss setlocal foldmethod=marker foldmarker={,}
" autocmd FileType css,scss nnoremap <silent> <leader>S vi{:sort<CR>
" autocmd FileType python setlocal foldmethod=indent
" autocmd FileType markdown setlocal nolist
" autocmd FileType vim setlocal fdm=indent keywordprg=:help
" autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
