"vim-lsp Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" LSP "
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'ray-x/lsp_signature.nvim'


Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'rafamadriz/friendly-snippets'

Plug 'jiangmiao/auto-pairs'

" Norifications
Plug 'rcarriga/nvim-notify'

" Colors
Plug 'chrisbra/Colorizer'

" I3 config Colors
Plug 'mboughaba/i3config.vim'

" Better quick fix "
Plug 'kevinhwang91/nvim-bqf' 

" Lines "
Plug 'myusuf3/numbers.vim'

" fuzzy finder "
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" tab line "
Plug 'romgrk/barbar.nvim'

" status line "
Plug 'nvim-lualine/lualine.nvim'

" color "
Plug 'norcalli/nvim-colorizer.lua'

" File Browser "
Plug 'kyazdani42/nvim-tree.lua'

" Theme "
Plug 'Mofiqul/vscode.nvim'

" Icons "
Plug 'kyazdani42/nvim-web-devicons'

" Tree Sitter "
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Tree Sitter Context "
Plug 'haringsrob/nvim_context_vt'

" Tree Sitter Rainbow Brackets
Plug 'p00f/nvim-ts-rainbow'

" Terminal "
Plug 'akinsho/toggleterm.nvim'

" Initialize plugin system
call plug#end()


