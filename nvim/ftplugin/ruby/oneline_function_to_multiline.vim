" DEPENDENCY:
" AndrewRadev/splitjoin.vim
" jeetsukumaran/vim-indentwise
"
" EXAMPLE:
" create_list :magazine_subscription, 12, user: user, magazine_package: magazine_package
"
" when cursor is on `create_list` word, transforms to
"
" create_list(
"   :magazine_subscription,
"   12,
"   user: user,
"   magazine_package: magazine_package
" )

nnoremap <buffer><leader>m W:SplitjoinSplit<CR>o<esc>k^f{x^W:SplitjoinSplit<CR>/}<CR>ddk:execute "normal \"xd\<Plug>(textobj-indent-i)"<cr>?(<CR>}"xp{dd}dd
