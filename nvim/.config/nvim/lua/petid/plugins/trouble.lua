return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- Trouble
        --  vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
        --  vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
        --  vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
        --  vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
        --  vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
        --  vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
    },

    config = function ()
        require("trouble").setup({})

        vim.keymap.set("n", "<leader>tt", function ()
            require("trouble").toggle()
        end)

        vim.keymap.set("n", "<leader>tn", function ()
            require("trouble").next({skip_groups = true, jump = true});
        end)

        vim.keymap.set("n", "<leader>tN", function ()
            require("trouble").previous({skip_groups = true, jump = true});
        end)

    end
}
