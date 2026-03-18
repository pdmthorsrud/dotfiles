-- =============================================================================
-- LSP + Mason setup for Neovim 0.11.3+
-- Uses the new vim.lsp.config() / vim.lsp.enable() API
-- Require this file from your lazy.nvim plugin list
-- =============================================================================

return {
    -- Mason: manages LSP servers, linters, formatters
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    -- Bridge between Mason and lspconfig
    -- Automatically calls vim.lsp.enable() for installed servers
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ruff",   -- fast Python linter/formatter
                "jsonls", -- JSON
                "yamlls", -- YAML
                "marksman",
                "bashls", -- Bash
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    -- nvim-lspconfig: provides server configs in its lsp/ directory.
    -- vim.lsp.config() finds them automatically.
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            -- Customize specific servers with vim.lsp.config()
            -- (this merges with the defaults from nvim-lspconfig's lsp/ directory)
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Keymaps — only active when an LSP server attaches to a buffer.
            -- Note: Nvim 0.11+ sets some defaults already (K for hover, grn for
            -- rename, gra for code action, grr for references, etc.)
            -- These add/override with more traditional bindings:
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
                end,
            })
        end,
    },
}
