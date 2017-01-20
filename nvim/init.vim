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
set noswapfile

call EnsureExists(s:cache_dir)
call EnsureExists(&directory)

if !executable('ag')
  echoerr('You must install silver searcher')
endif

" base configuration
set showfulltag
set shell=zsh
set noshelltemp                                     "use pipes
set clipboard=unnamed

" whitespace
" set autoindent                                      "automatically indent to match adjacent lines
set expandtab                                       "spaces instead of tabs
let &tabstop=s:settings.default_indent              "number of spaces per tab for display
let &softtabstop=s:settings.default_indent          "number of spaces per tab in insert mode
let &shiftwidth=s:settings.default_indent           "number of spaces when indenting
set list                                            "highlight whitespace
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮,space:·
set shiftround
set linebreak
let &showbreak='↪ '

" set scrolloff=1                                     "always show content after scroll
" set scrolljump=5                                    "minimum number of lines to scroll
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
call dein#add('tpope/vim-eunuch') " unix shell commands
call dein#add('tpope/vim-unimpaired') "{{{
  nmap <c-up> [e
  nmap <c-down> ]e
  vmap <c-up> [egv
  vmap <c-down> ]egv
"}}}
call dein#add('vim-scripts/bufkill.vim')
call dein#add('mhinz/vim-startify') "{{{
  let g:startify_session_dir = s:get_cache_dir('sessions')
  let g:startify_change_to_vcs_root = 1
  let g:startify_show_sessions = 1
  nnoremap <F1> :Startify<cr>
"}}}
call dein#add('scrooloose/syntastic') "{{{
  " let g:syntastic_aggregate_errors = 1
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_style_error_symbol = '✠'
  let g:syntastic_warning_symbol = '∆'
  let g:syntastic_style_warning_symbol = '≈'
"}}}
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
call dein#add('ap/vim-css-color', {'on_ft':['css','scss','sass','less','styl']})
call dein#add('othree/html5.vim', {'on_ft':['html']})
call dein#add('digitaltoad/vim-jade', {'on_ft':['jade']})
call dein#add('mustache/vim-mustache-handlebars', {'on_ft':['mustache','handlebars']})
call dein#add('gregsexton/MatchTag', {'on_ft':['html','xml']})
call dein#add('mattn/emmet-vim', {'on_ft':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache','handlebars']}) "{{{
  function! s:zen_html_tab()
    if !emmet#isExpandable()
      return "\<plug>(emmet-move-next)"
    endif
    return "\<plug>(emmet-expand-abbr)"
  endfunction
  " TODO check in html
  autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><tab> <c-y>,
  autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()
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
  nnoremap <leader>fjs :call JsBeautify()<cr>
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
call dein#add('honza/vim-snippets')
call dein#add('Valloric/YouCompleteMe') "{{{
  let g:ycm_path_to_python_interpreter = '/usr/bin/python'
  let g:ycm_complete_in_comments_and_strings=1
  let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
  let g:ycm_filetype_blacklist={'unite': 1}
"}}}
call dein#add('SirVer/ultisnips') "{{{
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  let g:UltiSnipsSnippetsDir='~/.config/nvim/snippets'
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#add('editorconfig/editorconfig-vim', {'on_i':1})
call dein#add('tpope/vim-endwise') " wisely add 'end' in ruby, endfunction/endif/more in vim script
call dein#add('tpope/vim-speeddating') " use CTRL-A/CTRL-X to increment dates
call dein#add('thinca/vim-visualstar') " search your selection text
call dein#add('tpope/vim-commentary')
call dein#add('terryma/vim-expand-region') " Press + to expand the visual selection and _ to shrink it
call dein#add('chrisbra/NrrwRgn')
call dein#add('jiangmiao/auto-pairs') "{{{
  let g:AutoPairsShortcutToggle = ''
  let g:AutoPairsMapCh = 0
"}}}
call dein#add('justinmk/vim-sneak') "{{{
  let g:sneak#streak = 1
"}}}
call dein#add('vim-scripts/eraseSubword') " {{{
  " TODO map to command mode
  " cnoremap <C-Q> <C-F>:call <SID>Erase()<C-C>
" }}}
call dein#add('tommcdo/vim-exchange')
call dein#add('junegunn/vim-easy-align') " {{{
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
" }}}
call dein#add('vim-scripts/ExtractMatches',{'depends':['vim-scripts/ingo-library','vim-scripts/PatternsOnText']}) " {{{
  call dein#add('vim-scripts/ingo-library')
  call dein#add('vim-scripts/PatternsOnText')
  nmap ym :%YankMatches:::+<left><left>
  vmap ym :YankMatches:::+<left><left>
  nmap yM :%PrintMatches::<left>
  vmap yM :PrintMatches::<left>
" }}}
" TODO install or delete
" call dein#add('bkad/CamelCaseMotion')

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
call dein#add('dkprice/vim-easygrep', {'on_cmd':'GrepOptions'}) "{{{
  let g:EasyGrepRecursive=1
  let g:EasyGrepAllOptionsInExplorer=1
  let g:EasyGrepCommand=1
  nnoremap <leader>vo :GrepOptions<cr>
"}}}
call dein#add('ctrlpvim/ctrlp.vim', { 'depends': 'tacahiroy/ctrlp-funky' }) "{{{
  call dein#add('tacahiroy/ctrlp-funky')
  let g:ctrlp_clear_cache_on_exit=1
  let g:ctrlp_max_height=40
  let g:ctrlp_show_hidden=0
  let g:ctrlp_follow_symlinks=1
  let g:ctrlp_max_files=20000
  let g:ctrlp_cache_dir=s:get_cache_dir('ctrlp')
  let g:ctrlp_reuse_window='startify'
  let g:ctrlp_extensions=['funky']
  let g:ctrlp_custom_ignore = {
        \ 'dir': '\v[\/]\.(git|hg|svn|idea)$',
        \ 'file': '\v\.DS_Store$'
        \ }

  if executable('ag')
    let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
  endif

  nmap \ [ctrlp]
  nnoremap [ctrlp] <nop>

  nnoremap [ctrlp]t :CtrlPBufTag<cr>
  nnoremap [ctrlp]T :CtrlPTag<cr>
  nnoremap [ctrlp]l :CtrlPLine<cr>
  nnoremap [ctrlp]o :CtrlPFunky<cr>
  nnoremap [ctrlp]f :CtrlPMRUFiles<cr>
  nnoremap [ctrlp]b :CtrlPBuffer<cr>
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
call dein#add('myusuf3/numbers.vim')

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


" {{{
  nnoremap <silent> <space><space> :<C-u>Denite buffer<cr>
" }}}

" git ls-files for file_rec {{{
  call denite#custom#alias('source', 'file_rec/git', 'file_rec')
  call denite#custom#var('file_rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])
  nnoremap <silent> <space>p :<C-u>Denite `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
" }}}

call dein#add('Shougo/neomru.vim') " {{{
  nnoremap <silent> <space>m :<C-u>Denite file_mru <cr>
" }}}

call dein#add('Shougo/neoyank.vim') " {{{
  nnoremap <silent> <space>y :<C-u>Denite neoyank<cr>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <leader>s :sort<cr>

nnoremap <leader>w :w<cr>

" toggle paste
map <F6> :set invpaste<CR>:set paste?<CR>

" remap arrow keys
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>

" change cursor position in insert and command mode
cnoremap <M-h> <left>
cnoremap <M-l> <right>
cnoremap <M-j> <down>
cnoremap <M-k> <up>

" clipboard actions
nnoremap <M-p> "+p
vnoremap <M-p> "+p
imap     <M-p> <C-r>+
cmap     <M-p> <C-r>+

nnoremap <M-P> "+P
vnoremap <M-P> "+P

nnoremap <M-y> "+y
vnoremap <M-y> "+y

nnoremap <M-d> "+d
vnoremap <M-d> "+d

" deleting
inoremap <C-u> <C-g>u<C-u>
inoremap <C-d> <Del>

if mapcheck('<space>/') == ''
  nnoremap <space>/ :vimgrep //gj **/*<left><left><left><left><left><left><left><left>
endif

" sane regex
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v

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
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>

" make Y consistent with C and D. See :help Y.
nnoremap Y y$

" quick buffer open
nnoremap gb :ls<cr>:e #

" general
nmap <leader>l :set list! list?<cr>
nnoremap <BS> :noh<cr>

" TODO what this evaluate
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" helpers for profiling
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

" commands
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

" nvim terminal emulator
tnoremap <M-Esc> <C-\><C-n>

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
set autowrite
set autowriteall

autocmd FileType css,scss setlocal foldmethod=marker foldmarker={,}
autocmd FileType css,scss nnoremap <silent> <leader>S vi{:sort<CR>
autocmd FileType python setlocal foldmethod=indent
autocmd FileType markdown setlocal nolist
autocmd FileType vim setlocal fdm=indent keywordprg=:help
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

