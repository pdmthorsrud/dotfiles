return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile      = { enabled = true },
            quickfile    = { enabled = true },
            scope        = { enabled = true },
            words        = { enabled = true },
            input        = { enabled = true },
            statuscolumn = { enabled = true },
            indent       = { enabled = true, scope = { enabled = false } },
            scroll       = { enabled = true },
            notifier     = { enabled = true },
            gitbrowse    = { enabled = true },
            dim          = { enabled = true },
            zen          = {
                enabled = true,
                win = { width = 0.65 },
            },
            terminal     = {
                enabled = true,
                win = {
                    position = "float",
                    height   = 0.85,
                    width    = 0.85,
                },
            },
            explorer     = { enabled = true },
            picker       = { enabled = true },
            dashboard    = { enabled = true },
        },
    },
}
