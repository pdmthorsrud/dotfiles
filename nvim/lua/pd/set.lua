vim.o.fileformats = "unix,dos,mac"

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 0
vim.opt.formatoptions:remove("t")
vim.opt.expandtab = true
vim.opt.conceallevel = 1

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
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

vim.cmd.colorscheme "everforest"

-- SnacksPickerTree defaults to LineNr which makes the explorer's tree
-- characters (│ ├ └) visually stand out. Link to Comment for a subtler look.
-- Untracked/ignored files default to NonText which is very low contrast;
-- use a lighter grey closer to white for better readability.
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "SnacksPickerTree", { link = "Comment" })
        vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#d3c6aa" })
        vim.api.nvim_set_hl(0, "SnacksPickerGitStatusIgnored", { fg = "#d3c6aa" })
        vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#d3c6aa" })
        vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { fg = "#d3c6aa" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#e69875", bold = true })
    end,
})
vim.api.nvim_set_hl(0, "SnacksPickerTree", { link = "Comment" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#e69875", bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#d3c6aa" })
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusIgnored", { fg = "#d3c6aa" })
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#d3c6aa" })
vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { fg = "#d3c6aa" })

-- set a lua global variable for neovim
vim.g.magma_automatically_open_output = false
vim.g.python3_host_prog = vim.fn.expand("~/virtualenvironments/nvim_python_devel/bin/python3")

