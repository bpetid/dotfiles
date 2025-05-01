return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- Replace <CurrentMajor> by the latest major version of LuaSnip
		-- install jsregexp (optional!).
		build = "make install_jsregexp",

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

			-- 	vim.keymap.set({ "i" }, "<C-K>", function() lsnip.expand() end, { silent = true })
			-- 	vim.keymap.set({ "i", "s" }, "<C-L>", function() lsnip.jump(1) end, { silent = true })
			-- 	vim.keymap.set({ "i", "s" }, "<C-J>", function() lsnip.jump(-1) end, { silent = true })
		end,
	},
}
