-- snacks.picker extras (see telescope.lua for basic pickers)
vim.keymap.set("n", "<leader>fas", function() Snacks.picker.grep() end,                                                  { desc = "Grep (regex)" })
vim.keymap.set("n", "<leader>fs",  function() Snacks.picker.grep({ dirs = { vim.fn.expand("%:p:h") } }) end,             { desc = "Grep in current file dir" })
vim.keymap.set("n", "<leader>fds", function()
    local dir = vim.fn.input("Directory: ", "", "dir")
    if dir ~= "" then Snacks.picker.grep({ cwd = dir }) end
end, { desc = "Grep in directory" })
vim.keymap.set("n", "<leader>fdf", function()
    local dir = vim.fn.input("Directory: ", "", "dir")
    if dir ~= "" then Snacks.picker.files({ cwd = dir }) end
end, { desc = "Find files in directory" })

-- QoL stuff
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")
vim.keymap.set("n", "<leader>bc", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- obsidian
vim.keymap.set("n", "<leader>bf", ":ObsidianQuickSwitch<CR>")

-- window management
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', '<leader>q', vim.cmd.close)

-- write buffer
vim.keymap.set('n', '<leader>ss', vim.cmd.write)

-- remap <leader>lr to reload lua config
vim.keymap.set("n", "<leader>lr", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^pd") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.fn.stdpath("config") .. "/lua/pd/init.lua")
  vim.notify("Config reloaded!", vim.log.levels.INFO)
end)

-- snacks.terminal (replaces vim-floaterm)
vim.keymap.set("n",               "<leader>nt", function() Snacks.terminal(nil, { cwd = vim.fn.expand("%:p:h") }) end, { desc = "Terminal (current dir)" })
vim.keymap.set({ "n", "v", "i", "t" }, "<F5>", function() Snacks.terminal.toggle() end,                              { desc = "Toggle terminal" })

-- snacks.zen
vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle zen mode" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/pd/packer.lua<CR>");
vim.keymap.set("n", "<leader>vpr", "<cmd>e ~/.config/nvim/lua/pd/remap.lua<CR>");
vim.keymap.set("n", "<leader>jr", "<cmd>luafile ~/.config/nvim/lua/pd/init.lua<CR>");


-- snacks.explorer (replaces nvim-tree + telescope-file-browser)
vim.keymap.set("n", "<leader>t",  function() Snacks.explorer() end, { desc = "File explorer" })
vim.keymap.set("n", "<leader>ft", function() Snacks.explorer() end, { desc = "File explorer" })

-- comment toggle (native gc operator, Neovim 0.10+)
vim.keymap.set('n', '<leader>cc', 'gcc', { remap = true })
vim.keymap.set('v', '<leader>cc', 'gc', { remap = true })


