return {
	"nvim-telescope/telescope.nvim", tag = "0.1.3",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function ()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>?", function ()
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, {desc = '[?] Fuzzily search in current buffer.]' })
	end
}
