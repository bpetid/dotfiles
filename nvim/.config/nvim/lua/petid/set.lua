vim.opt.nu = true -- line numbers
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smarttab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

local undodir = vim.fn.stdpath("data") .. "/undodir"
-- Create the directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
	print("Creating undo directory: " .. undodir)
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.opt.timeoutlen = 350

vim.opt.autochdir = false
vim.opt.inccommand = "split"

vim.opt.listchars = "eol:¬,tab:▸ ,trail:~,extends:>,precedes:<"
vim.opt.list = false

vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess:append("c")
