set tabstop=2 sw=2
set termguicolors

let path = '~/.config/nvim/config/'
exec 'source' path . 'mappings.vim'
exec 'source' path . 'plugins.vim'

lua require('init')
set completeopt=menuone,noselect

let g:material_style = 'custom'
colorscheme material

let g:numbers_exclude = ['NvimTree']
