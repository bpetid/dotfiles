return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"williamboman/mason-lspconfig.nvim",
		require("petid.plugins.cmp"),
		{ "j-hui/fidget.nvim",       opts = {} },
		{ "williamboman/mason.nvim", config = true },
	},

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local on_attach = function(client)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true)
			end
			if client.name == "ruff" then
				-- disable hover provider since I use pyrigh
				client.server_capabilities.hoverProvider = false
			end
		end

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"clangd",
				"jsonls",
				"lua_ls",
				"pyright",
				"ruff",
				"yamlls",
				"typos_lsp"
			},
			automatic_enable = true
		})

		vim.lsp.config('ruff', {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				ruff = {
					enabled = true,
					formatEnabled = true,
					extendSelect = { "I", "C", "C90", "C901", "E4", "E7", "E9", "F", "PL", "E", "W", "UP", "B", "SIM", "I", "TCH", "RUF", "Q", },
					format = { "I" },
					severities = { ["D212"] = "I" },
					unsafeFixes = true,
					-- Rules that are ignored when a pyproject.toml or ruff.toml is present:
					lineLength = 160,
					select = { "F" },
					ignore = {},
					preview = false,
					targetVersion = "py39",
				},
			}
		})

		vim.lsp.config('lua_ls', {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = {
						globals = {}
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				}
			}
		})

		vim.lsp.config('typos_lsp', {
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				diagnosticSeverity = "Hint"
			},
			settings = {
			}
		})

		-- VIRTUAL TEXT
		vim.diagnostic.config({
			update_on_insert = true,
			underline = true,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
			},
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
			inlay_hints = {
				enabled = true,
			},

		})

		-- KEYMAPS
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<Leader>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
				vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set({ 'n', 'v' }, '<Leader>f', function()
					vim.lsp.buf.format { async = true }
				end, opts)
			end,
		})
	end,
}
