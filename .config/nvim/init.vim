call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
call plug#end()


lua require ('basic')
lua require ('init')
