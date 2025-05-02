return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require('harpoon')
		harpoon:setup({})

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end

		vim.keymap.set("n", "<C-x>", function() toggle_telescope(harpoon:list()) end,
			{ desc = "Open harpoon window" })
		vim.keymap.set("n", "<C-S-X>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
			print("File added to harpoon...")
		end)

		vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-m>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-,>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-.>", function() harpoon:list():select(4) end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-P>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<C-L>", function() harpoon:list():next() end)
	end
}
