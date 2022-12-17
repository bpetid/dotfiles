local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
--     'sumneko_lua',
--     'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-z>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

vim.diagnostic.config({
    virtual_text = true,
})

-- lsp.on_attach(function(client, bufnr)
--     local opts = {buffer = bufnr, remap = false}
-- 
--     if client.name == "eslint" then
--         vim.cmd [[ LspStop eslint ]]
--         return
--     end
-- end)

-- require('lspconfig').arduino_language_server.setup{}

    lsp.setup() 
