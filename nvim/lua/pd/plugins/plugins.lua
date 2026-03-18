return {
    "christoomey/vim-tmux-navigator",
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        ft = "markdown",
        ---@module 'obsidian'
        ---@type obsidian.config
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/projects/notes/obsidian_notes/",
                }
            },
        },
    },
    {
        'echasnovski/mini.pairs',
        version = '*',
        config = function()
            require('mini.pairs').setup()
        end
    },
    'glepnir/zephyr-nvim',
    "nvim-tree/nvim-web-devicons",
    { 'rose-pine/neovim', name = 'rose-pine' },
    {
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup()
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup {
                ensure_installed = 'all',
                highlight = { enable = true },
            }
        end,
    },
    -- switch quickly between files
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    'mbbill/undotree',
    'shaunsingh/nord.nvim',
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
            vim.keymap.set("x", "Z", "<Plug>(nvim-surround-visual)", { desc = "Surround visual" })
            vim.keymap.set("x", "gZ", "<Plug>(nvim-surround-visual-line)", { desc = "Surround visual line" })
        end
    },
    'nvim-lualine/lualine.nvim',
    'folke/tokyonight.nvim',
    'rebelot/kanagawa.nvim',
    'tpope/vim-repeat',
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    sql = { "sql_formatter" },
                    python = { "ruff_format" },
                    lua = { "stylua" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
            })
        end,
    },
    {
        url = "https://codeberg.org/andyg/leap.nvim.git",
        config = function()
            local leap = require("leap")

            vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
            vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-from-window)")

            vim.keymap.set({ "n", "x", "o" }, "gs", function()
                require("leap.remote").action()
            end)

            vim.keymap.set({ "x", "o" }, "R", function()
                require("leap.treesitter").select({
                    opts = require("leap.user").with_traversal_keys("R", "r"),
                })
            end)

            require("leap.user").set_repeat_keys("<enter>", "<backspace>")

            leap.opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }

            leap.opts.preview_filter = function(ch0, ch1, ch2)
                return not (
                    ch1:match("%s")
                    or (ch0:match("%a") and ch1:match("%a") and ch2:match("%a"))
                )
            end

            vim.api.nvim_create_autocmd("User", {
                pattern = "RemoteOperationDone",
                group = vim.api.nvim_create_augroup("LeapRemote", {}),
                callback = function(event)
                    if vim.v.operator == "y" and event.data.register == '"' then
                        vim.cmd("normal! p")
                    end
                end,
            })
        end,
    },
}
