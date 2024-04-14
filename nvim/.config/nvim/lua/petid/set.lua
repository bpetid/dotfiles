vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smarttab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.autochdir = false

vim.opt.listchars = "eol:¬,tab:▸ ,trail:~,extends:>,precedes:<"
vim.opt.list = true

vim.g.python3_host_prog = "/home/petid/.cache/pypoetry/virtualenvs/neovim-py3-1Bn8z-Kw-py3.11/bin/python"
