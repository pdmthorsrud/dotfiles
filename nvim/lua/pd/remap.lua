vim.keymap.set("n", "<leader>fas", ":Telescope live_grep use_regex=true search=<CR>")
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep use_regex=true search_dirs={vim.fn.expand('%:p')} search=<CR>")

vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")

vim.keymap.set("n", "<leader>bc", ":BufferClose<CR>")

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

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/pd/packer.lua<CR>");
vim.keymap.set("n", "<leader>vpr", "<cmd>e ~/.config/nvim/lua/pd/remap.lua<CR>");
vim.keymap.set("n", "<leader>jr", "<cmd>luafile ~/.config/nvim/lua/pd/init.lua<CR>");


-- Nvim tree stuff
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)


-- QoL maps
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', '<leader>ss', vim.cmd.write)
vim.keymap.set('n', '<leader>q', vim.cmd.close)


-- comment toggle
vim.keymap.set({'n'}, '<leader>c', vim.cmd.CommentToggle)
vim.keymap.set({'v'}, '<leader>c', ":'<,'>CommentToggle<CR>")

-- telescope dir
vim.keymap.set("n", "<leader>fds", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fdf", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })


-- remap <leader>ss to save file
vim.keymap.set("n", "<leader>ss", ":w<CR>")


-- remap <leader>lr to reload lua config
vim.keymap.set("n", "<leader>lr", ":luafile ~/.config/nvim/lua/pd/init.lua<CR>")


-- magma python scripts rewriting all lines above
vim.keymap.set("n", "<leader>r", ":MoltenEvaluateOperator<CR>")
vim.keymap.set("n", "<leader>rr", ":MoltenEvaluateLine<CR>")
vim.keymap.set({'v'}, "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>")
vim.keymap.set("n", "<leader>rc", ":MoltenReevaluateCell<CR>")
vim.keymap.set("n", "<leader>rd", ":MoltenDelete<CR>")
vim.keymap.set("n", "<leader>ro", ":MoltenShowOutput<CR>")


-- file browser mappings
vim.api.nvim_set_keymap(
  "n",
  "<leader>ft",
  ":Telescope file_browser<CR>",
  { noremap = true }
)
