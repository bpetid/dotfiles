return {
	{
		"L3MON4D3/LuaSnip",
		-- install jsregexp (optional!).
		build = vim.fn.has "win32" ~= 0 and "make install_jsregexp" or nil,

		dependencies = {
			"rafamadriz/friendly-snippets",
			"benfowler/telescope-luasnip.nvim",
		},

		config = function(_, opts)
			local lsnip = require("luasnip")
			if opts then lsnip.config.setup(opts) end
			vim.tbl_map(
				function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
				{ "vscode", "snipmate", "lua" }
			)
			-- friendly-snippets - enable standardized comments snippets
			lsnip.filetype_extend("typescript", { "tsdoc" })
			lsnip.filetype_extend("javascript", { "jsdoc" })
			lsnip.filetype_extend("lua", { "luadoc" })
			lsnip.filetype_extend("python", { "pydoc" })
			lsnip.filetype_extend("rust", { "rustdoc" })
			lsnip.filetype_extend("cs", { "csharpdoc" })
			lsnip.filetype_extend("java", { "javadoc" })
			lsnip.filetype_extend("c", { "cdoc" })
			lsnip.filetype_extend("cpp", { "cppdoc" })
			lsnip.filetype_extend("php", { "phpdoc" })
			lsnip.filetype_extend("kotlin", { "kdoc" })
			lsnip.filetype_extend("ruby", { "rdoc" })
			lsnip.filetype_extend("sh", { "shelldoc" })

			vim.keymap.set({ "i" }, "<c-s>e", function() lsnip.expand() end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<c-s>k", function()
				if lsnip.choice_active() then
					lsnip.change_choice(1)
				end
			end, { silent = true })
		end,
	},
}
