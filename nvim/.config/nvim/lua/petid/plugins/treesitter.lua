return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "vim", "vimdoc", "gitignore", "gitcommit"},
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
			indent = {
				enable = true
			},
			incremental_selection = {
				enable = false,
--				keymaps = {
--					init_selection = "<leader>k", -- set to `false` to disable one of the mappings
--					node_incremental = "<leader>l",
--					scope_incremental = "<leader>,",
--					node_decremental = "<leader>j",
--				},
			},
		})

		local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		treesitter_parser_config.templ = {
			install_info = {
				url = "https://github.com/vrischmann/tree-sitter-templ.git",
				files = {"src/parser.c", "src/scanner.c"},
				branch = "master",
			},
		}
	end
}
