let g:dotvim_settings = {}
let g:dotvim_settings.version = 2
let g:dotvim_settings.plugin_groups_exclude = ['go','scala']
let g:dotvim_settings.autocomplete_method = 'ycm'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
source ~/.config/nvim/vimrc

" TODO Some plugin spoil iskeyword, find him
set iskeyword&
