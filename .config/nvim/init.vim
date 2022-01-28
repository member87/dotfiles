set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif


let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'NvimTree', 'Telescope']

let path = '~/.config/nvim/config/'
exec 'source' path . 'plugins.vim'
exec 'source' path . 'mappings.vim'

lua require('init')
lua vim.notify = require("notify")


syntax on
let g:vscode_style = "dark"
let g:vscode_italic_comment = 1
colorscheme vscode

set completeopt=menuone,noselect


