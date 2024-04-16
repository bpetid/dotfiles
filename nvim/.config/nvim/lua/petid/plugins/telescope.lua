return {
	"nvim-telescope/telescope.nvim", tag = "0.1.3",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function ()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pc", builtin.find_files, {}) 	-- find file in project
		vim.keymap.set("n", "<leader>ps", function ()				-- search in curr file
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, {desc = '[<leader>fs] Fuzzily search in current buffer.]' })
		vim.keymap.set("n", "<leader>pw", builtin.grep_string, {})	-- find curr word
		require("telescope").setup({
			pickers = {
				find_files = {
					theme = "dropdown",
				}
			}
		})
	end,
}
