vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smarttab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

if jit.os == "Linux" then
	vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"
elseif jit.os == "Windows" then
	vim.opt.undodir = os.getenv("USERPROFILE") .. "\\nvim\\undodir"
end

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")

vim.opt.termguicolors = true

vim.opt.scrolloff = 16
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.opt.timeoutlen = 350

vim.opt.autochdir = false
vim.opt.inccommand = "split"

vim.opt.listchars = "eol:¬,tab:▸ ,trail:~,extends:>,precedes:<"
vim.opt.list = true
