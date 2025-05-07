return {
    {
        "nvim-neorg/neorg",
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.integrations.telescope"] = {},
            },
        },
        dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
        lazy = false,
        version = "*",
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/projects/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                },
            }

            vim.wo.foldlevel = 99
            vim.wo.conceallevel = 2
        end,
    },
    "folke/neodev.nvim",
    'ruifm/gitlinker.nvim',
    'hlucco/nvim-eswpoch',
    -- disabled because of dashbaord plugin
    -- {
    --     "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} ,
    --     cond = function()
    --         return not string.match(vim.fn.fnamemodify(vim.fn.bufname("%"), ":t"), ".*%dashboard")
    --     end,
    -- },
    {
        'goolord/alpha-nvim',
        dependencies = {
            'echasnovski/mini.icons',
            'nvim-lua/plenary.nvim'
        },
        config = function ()
            require'alpha'.setup(require'alpha.themes.theta'.config)
        end
    },
    {'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
    -- {
    --     'echasnovski/mini.trailspace', version = '*', -- Use for stability; omit to use `main` branch for the latest features
    --     config = function ()
    --         require('mini.trailspace').setup()
    --     end
    -- },
    {
        'echasnovski/mini.pairs', version = '*', -- Use for stability; omit to use `main` branch for the latest features
        config = function ()
            require('mini.pairs').setup()
        end
    },
    {
      "princejoogie/dir-telescope.nvim",
      -- telescope.nvim is a required dependency
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("dir-telescope").setup({
          -- these are the default options set
          hidden = true,
          no_ignore = false,
          show_preview = true,
        })
      end,
    },
    {
        'gen740/SmoothCursor.nvim',
    },
    "folke/which-key.nvim",
    "github/copilot.vim",
    'nvim-lua/plenary.nvim',
    'glepnir/zephyr-nvim',
    "github/copilot.vim",
    --'preservim/nerdtree',
    {'nvim-tree/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup()
        end
    },
    "nvim-tree/nvim-web-devicons",
    'glepnir/zephyr-nvim',
    { 'rose-pine/neovim', name = 'rose-pine' },
    -- fuzzyfinding whatever you want
    {'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' }},
    {
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup()
        end
    },
    -- lsp config
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
    'nvim-treesitter/playground',
    -- switch quickly between files
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- zettelkasten plugin
    "mickael-menu/zk-nvim",
    'mbbill/undotree',
    -- run python scripts interactively (like a notebook without using a notebook)
    {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
        -- this is an example, not a default. Please see the readme for more configuration options
        vim.g.molten_output_win_max_height = 12
    end,
},
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'voldikss/vim-floaterm',
    -- calculation plugin for vim
    'fcpg/vim-colddeck',
    --'preservim/vim-markdown',
    {"terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup()
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function()
            -- This is where you modify the settings for lsp-zero
            -- Note: autocompletion settings will not take effect

            require('lsp-zero.settings').preset({})
        end
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
            {"rafamadriz/friendly-snippets"},
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            -- The arguments for .extend() have the same shape as `manage_nvim_cmp`: 
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

            require('lsp-zero.cmp').extend()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()

            cmp.setup({
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
            {'williamboman/mason.nvim'},
        },
        config = function()
            -- This is where all the LSP shenanigans will live

            local lsp = require('lsp-zero')

            lsp.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp.default_keymaps({buffer = bufnr})
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()
        end
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                window = {
                    width = .65 -- width will be 85% of the editor width
                }
            })
        end
    },
    "eandrju/cellular-automaton.nvim",
    'shaunsingh/nord.nvim',
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "ys",
                    normal_cur = "yss",
                    normal_line = "yS",
                    normal_cur_line = "ySS",
                    visual = "Z",
                    visual_line = "gZ",
                    delete = "ds",
                    change = "cs",
                },
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    'nvim-lualine/lualine.nvim',
    'folke/tokyonight.nvim',
    --lazy
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    'luukvbaal/nnn.nvim',
    {
        "mickael-menu/zk-nvim",
        config = function()
            require("zk").setup({
                -- See Setup section below
            })
        end
    },
    'ggandor/leap.nvim'
}
