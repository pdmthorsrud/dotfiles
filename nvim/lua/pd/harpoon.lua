local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- snacks.picker integration for harpoon file list
local function toggle_harpoon_picker(harpoon_files)
    local items = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(items, { text = item.value, file = item.value })
    end
    Snacks.picker.pick({
        source  = "harpoon",
        items   = items,
        format  = "file",
    })
end

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() toggle_harpoon_picker(harpoon:list()) end,
    { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
