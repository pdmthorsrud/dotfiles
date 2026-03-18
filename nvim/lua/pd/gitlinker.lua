-- snacks.gitbrowse (replaces gitlinker.nvim)
vim.keymap.set({ "n", "v" }, "<leader>gy", function() Snacks.gitbrowse() end, { desc = "Git browse" })
