return {
    'ruifm/gitlinker.nvim',
    {
	    "obsidian-nvim/obsidian.nvim",
	    version = "*", -- recommended, use latest release instead of latest commit
	    ft = "markdown",
	    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	    -- event = {
		    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		    --   -- refer to `:h file-pattern` for more examples
		    --   "BufReadPre path/to/my-vault/*.md",
		    --   "BufNewFile path/to/my-vault/*.md",
		    -- },
		    ---@module 'obsidian'
		    ---@type obsidian.config
		    opts = {
			    workspaces = {
				    {
					    name = "personal",
					    path = "~/projects/notes/obsidian_notes/",
				    }
			    },

			    -- see below for full list of options 👇
		    },
	    },
	    -- disabled because of dashbaord plugin
    -- {
    --     "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} ,
    --     cond = function()
    --         return not string.match(vim.fn.fnamemodify(vim.fn.bufname("%"), ":t"), ".*%dashboard")
    --     end,
    -- },
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
    'nvim-lua/plenary.nvim',
    'glepnir/zephyr-nvim',
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
    'mbbill/undotree',
    -- run python scripts interactively (like a notebook without using a notebook)
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'voldikss/vim-floaterm',
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
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
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
            local luasnip = require('luasnip')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },
                preselect = cmp.PreselectMode.Item,
                sources = {
                    {name = 'nvim_lsp'},
                    {name = 'luasnip'},
                    {name = 'buffer'},
                    {name = 'path'},
                },
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<CR>'] = cmp.mapping.confirm({select = true}),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, {'i', 's'}),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {'i', 's'}),
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
    'ggandor/leap.nvim'
}
