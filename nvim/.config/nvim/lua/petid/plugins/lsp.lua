return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
		local on_attach = function(client, bufnr)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(bufnr, true)
			end
		end
		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"lua_ls",
				"rust_analyzer",
				"arduino_language_server",
				"asm_lsp",
				"bashls",
				"cmake",
				"jsonls",
				"yamlls",
				-- "ruff_lsp",
				-- "pyright"
				-- !install manually: python-lsp-server pylsp-mypy, python-lsp-ruff
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach
					}
				end,
				require('lspconfig').pylsp.setup {
					settings = {
						pylsp = {
							plugins = {
								ruff = {
									enabled = true, -- Enable the plugin
									formatEnabled = true,
									extendSelect = { "I", "C", "C90", "C901", "E4", "E7", "E9", "F", "PL", "E", "W", "UP", "B", "SIM", "I", "TCH", "RUF", "Q", },
									format = { "I" },
									severities = { ["D212"] = "I" },
									unsafeFixes = true,
									-- Rules that are ignored when a pyproject.toml or ruff.toml is present:
									lineLength = 88, -- Line length to pass to ruff checking and formatting
									select = { "F" }, -- Rules to be enabled by ruff
									ignore = {}, -- Rules to be ignored by ruff
									preview = false, -- Whether to enable the preview style linting and formatting.
									targetVersion = "py310", -- The minimum python version to target (applies for both linting and formatting).
								},
							}
						}
					}


				},
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" }
								}
							}
						}
					}
				end,
			}
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		-- Set up nvim-cmp.
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-e>'] = cmp.mapping.abort(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
			})
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources(
				{ { name = 'path' } },
				{ { name = 'cmdline' } }
			)
		})

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
				source = "always",
				header = "",
				prefix = "",
			},
			inlay_hints = {
				enabled = true,
			},
		})
	end
}
