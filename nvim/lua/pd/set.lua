vim.opt.ff = unix

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 79
vim.opt.expandtab = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.fillchars = {eob = " "}

vim.opt.updatetime = 50

vim.opt.colorcolumn = "250"
vim.cmd [[colorscheme rose-pine]]

-- set a lua global variable for neovim
vim.g.magma_automatically_open_output = false
vim.g.floaterm_height = 0.85
vim.g.floaterm_width = 0.85
vim.g.python3_host_prog=vim.fn.expand("~/virtualenvironments/nvim_python_devel/bin/python3")

