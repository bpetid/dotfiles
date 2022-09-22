call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'ggandor/leap.nvim'

" nvim-cmp install and dependencies only frome here
"
"  Plug 'neovim/nvim-lspconfig'
"  Plug 'hrsh7th/cmp-nvim-lsp'
"  Plug 'hrsh7th/cmp-buffer'
"  Plug 'hrsh7th/cmp-path'
"  Plug 'hrsh7th/cmp-cmdline'
"  Plug 'hrsh7th/nvim-cmp'
"  Plug 'hrsh7th/cmp-vsnip'
"  Plug 'hrsh7th/vim-vsnip'

call plug#end()

map <F8> : !python % <CR>


lua require ('init')
