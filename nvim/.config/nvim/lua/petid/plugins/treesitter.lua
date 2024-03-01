return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "c_sharp", "python", "perl", "ninja", "markdown_inline", "make", "gitignore", "gitcommit", "bash", "xml" },
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>k", -- set to `false` to disable one of the mappings
                    node_incremental = "<leader>l",
                    scope_incremental = "<leader>,",
                    node_decremental = "<leader>j",
                },
            },
        })
    end
}
