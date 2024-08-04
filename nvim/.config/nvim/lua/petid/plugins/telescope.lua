return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		local builtin = require("telescope.builtin")

		-- keymaps ------------------------------------------------------------------------------
		vim.keymap.set("n", "<leader>pc", builtin.find_files, {}) -- find file in project
		vim.keymap.set("n", "<leader>,", function()         -- search in curr file
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = true,
			})
		end, { desc = '[<leader>,] Fuzzily search in current buffer.' })
		vim.keymap.set("n", "<leader>pr", builtin.grep_string, {}) -- find curr word
		vim.keymap.set("n", "<leader>prr", builtin.live_grep, {}) -- find curr word
		vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})


		-- setup --------------------------------------------------------------------------------
		require("telescope").setup({
			pickers = {
				find_files = {
					theme = "dropdown",
				}
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				everything = {
					es_path = "es",
					case_sensitity = false,
					whole_word = false,
					match_path = false,
					sort = true,
					regex = true,
					offset = 0,
					max_results = 100,
				}
			}
		})

		-- extensions ---------------------------------------------------------------------------
		if jit.os == "Linux" then
			require('telescope').load_extension('fzf')
		elseif jit.os == "Windows" then
			require('telescope').load_extension 'everything'
		end
	end,
}
