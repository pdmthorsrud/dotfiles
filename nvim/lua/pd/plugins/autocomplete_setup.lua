-- =============================================================================
-- Completion setup using blink.cmp
-- Replaces: nvim-cmp, cmp-nvim-lsp, cmp-buffer, cmp-path, cmp_luasnip, LuaSnip
-- =============================================================================

return {
    {
        "saghen/blink.cmp",
        -- provides snippets for the snippet source
        dependencies = { "rafamadriz/friendly-snippets" },

        -- use a release tag to download pre-built binaries
        version = "1.*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' = C-y to accept (vim-style)
            -- 'super-tab' = Tab to accept (vscode-style)
            -- 'enter' = Enter to accept
            --
            -- All presets include:
            --   C-space: open menu / open docs
            --   C-n/C-p: next/prev item
            --   C-e: hide menu
            --   C-k: toggle signature help
            keymap = { preset = "default" },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                -- show docs automatically when an item is selected
                documentation = { auto_show = true },
            },

            -- enable function signature help
            signature = { enabled = true },

            -- built-in sources — no extra plugins needed
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    snippets = {
                        opts = {
                            paths = { vim.fn.stdpath("config") .. "/snippets" },
                        },
                    },
                },
            },

            -- Rust fuzzy matcher with typo resistance
            -- Falls back to lua if the binary isn't available
            fuzzy = { implementation = "prefer_rust" },
        },
        opts_extend = { "sources.default" },
    },
}
