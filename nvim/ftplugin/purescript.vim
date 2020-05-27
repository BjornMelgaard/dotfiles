" Generate function template from a function signature on the current line
nmap <buffer><silent> <localleader>g :<C-U>PaddClause<CR>
" type annotation
nmap <buffer><silent> <localleader>at :<C-U>PaddType<CR>
" suggestion
nmap <buffer><silent> <localleader>ap :<C-U>Papply<CR>
" split case
nmap <buffer><silent> <localleader>s :<C-U>Pcase

" ?
nmap <buffer><silent> <localleader>iq :<C-U>PaddImportQualifications<CR>
nmap <buffer><silent> <localleader>ii :<C-U>Pimport<CR>
nmap <buffer><silent> <localleader>im :<C-U>PimportModule<CR>

nmap <buffer><silent> <localleader>s :<C-U>Pursuit<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Ptype<CR>
nmap <buffer><silent> <localleader>t :call LanguageClient_textDocument_hover()<CR>

nnoremap <buffer><localleader>r :call LanguageClient_textDocument_rename()<CR>

" nmap <buffer><silent> <localleader>t :<C-U>Plist<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Pimports<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Pload<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Prebuild<CR>

nmap <buffer><silent> <C-]> :<C-U>Pgoto<CR>

" nmap <buffer><silent> <localleader>t :<C-U>Pcwd<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Pend<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Psearch<CR>
" nmap <buffer><silent> <localleader>t :<C-U>Pstart<CR>


vmap <buffer><silent> <localleader>h S)%i<Space>::<Space>?hole1<ESC>
nmap <buffer><silent> <localleader>h viwS)%i<Space>::<Space>?hole1<ESC>


" -----------------------------------------------------------------

" https://gist.github.com/paluh/5f3d27708be4f8002cd74be51a228fc9

" turn all symbols into unicode or back

nmap <buffer><silent> <localleader>cu  :%s/ => / ⇒ /ge<CR>:%s/ -> / → /ge<CR>:%s/ <- / ← /ge<CR>:%s/ :: / ∷ /ge<CR>:%s/ <= / ⇐ /ge<CR>:%s/ forall / ∀ /ge<CR>
" nmap <buffer><silent> <localleader>cu  :%s/ forall / ∀ /ge<CR>
nmap <buffer><silent> <localleader>cU  :%s/⇒/=>/ge<CR>:%s/→/->/ge<CR>:%s/←/<-/ge<CR>:%s/∷/::/ge<CR>:%s/⇐/<=/ge<CR>:%s/∀/forall/ge<CR>

" convert symbols while typing

" iabbrev <buffer> forall ∀
" iabbrev <buffer> -> →
" iabbrev <buffer> <- ←
" iabbrev <buffer> => ⇒
" iabbrev <buffer> <= ⇐
" iabbrev <buffer> :: ∷

" these greek letters mapping is probably an overkill ;-)

iabbrev <buffer> alpha α
iabbrev <buffer> beta β
iabbrev <buffer> gama γ
iabbrev <buffer> delta δ
iabbrev <buffer> epsilon ε
iabbrev <buffer> lambda λ
iabbrev <buffer> mu μ
iabbrev <buffer> sigma σ

" " enable line searching for unicode chars

" map <buffer><silent> f:: f∷
" map <buffer><silent> t:: t∷
" map <buffer><silent> F:: F∷
" map <buffer><silent> T:: T∷

" map <buffer><silent> f-> f→
" map <buffer><silent> t-> t→
" map <buffer><silent> F-> F→
" map <buffer><silent> T-> T→

" map <buffer><silent> f=> f⇒
" map <buffer><silent> t=> t⇒
" map <buffer><silent> F=> F⇒
" map <buffer><silent> T=> T⇒
