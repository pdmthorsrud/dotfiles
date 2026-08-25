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
            gh           = { enabled = true },
            dim          = { enabled = true },
            dim          = { enabled = false },
            zen          = {
                enabled = true,
                toggles = { dim = false },
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
            picker       = {
                enabled = true,
                sources = {
                    explorer = { hidden = true },
                    gh_issue = {},
                    gh_pr    = {},
                    explorer = { hidden = true, ignored = true }
                }
            },
            dashboard    = { enabled = true },
        },
        keys = {
            { "<leader>gi", function() Snacks.picker.gh_issue() end,                  desc = "GitHub Issues" },
            { "<leader>gp", function() Snacks.picker.gh_pr() end,                     desc = "GitHub PRs" },
            { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (All)" },
            { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "GitHub PRs (All)" },
        },
    },
}
