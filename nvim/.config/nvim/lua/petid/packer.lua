-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- TELESCOPE
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    -- CATPPUCCIN colorscheme
    use {
        "catppuccin/nvim", as = "catppuccin"
    }


--    -- TROUBLE
--    use({
--        "folke/trouble.nvim",
--        config = function()
--            require("trouble").setup {
--                icons = false,
--                -- your configuration comes here
--                -- or leave it empty to use the default settings
--                -- refer to the configuration section below
--            }
--        end
--    })


    -- TREESITTER
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use("nvim-treesitter/nvim-treesitter-context");


    -- LSP-zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }


    --USELESS
    use("eandrju/cellular-automaton.nvim")
end)
