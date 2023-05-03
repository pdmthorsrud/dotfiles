
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fas", ":Telescope live_grep use_regex=true search=<CR>")
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep use_regex=true search_dirs={vim.fn.expand('%:p')} search=<CR>")

-- floaterm stuff
vim.keymap.set("n", "<leader>nt", ":FloatermNew! cd '%:p:h'<CR>")
vim.keymap.set({'n','v','i','t'}, "<F5>", "<C-\\><C-N>:FloatermToggle<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/pd/packer.lua<CR>");


-- Nvim tree stuff
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)


-- Markdown Preview
vim.keymap.set("n", "<C-p>", vim.cmd.MarkdownPreview)

-- QoL maps
vim.keymap.set('n', '<leader>w', vim.cmd.write)
vim.keymap.set('n', '<leader>q', vim.cmd.close)
