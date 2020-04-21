" Generate function template from a function signature on the current line
nmap <buffer><silent> <localleader>g :<C-U>PaddClause<CR>
" type annotation
nmap <buffer><silent> <localleader>at :<C-U>PaddType<CR>
" suggestion
nmap <buffer><silent> <localleader>ap :<C-U>Papply<CR>
" split case
nmap <buffer><silent> <localleader>s :<C-U>Pcase<CR>

" ?
nmap <buffer><silent> <localleader>ai :<C-U>PaddImportQualifications<CR>
nmap <buffer><silent> <localleader>i :<C-U>Pimport<CR>
" nmap <buffer><silent> <localleader>t :<C-U>PimportModule<CR>

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
nmap <buffer><silent> <localleader>cU  :%s/⇒/=>/ge<CR>:%s/→/->/ge<CR>:%s/←/<-/ge<CR>:%s/∷/::/ge<CR>:%s/⇐/<=/ge<CR>:%s/∀/forall/ge<CR>

" convert symbols while typing

iab forall ∀
iab -> →
iab <- ←
iab => ⇒
iab <= ⇐
iab :: ∷

" these greek letters mapping is probably an overkill ;-)

iab alpha α
iab beta β
iab gama γ
iab delta δ
iab epsilon ε
iab lambda λ
iab mu μ
iab sigma σ

" enable line searching for unicode chars

map f:: f∷
map t:: t∷
map F:: F∷
map T:: T∷

map f-> f→
map t-> t→
map F-> F→
map T-> T→

map f=> f⇒
map t=> t⇒
map F=> F⇒
map T=> T⇒
