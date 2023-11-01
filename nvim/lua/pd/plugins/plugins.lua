return {
	"folke/neodev.nvim",
	"folke/which-key.nvim",
	"github/copilot.vim",
	"lukas-reineke/indent-blankline.nvim",
	'nvim-lua/plenary.nvim',
	'glepnir/zephyr-nvim',
	"github/copilot.vim",
    "ms-jpq/chadtree",
    -- indentation guidelines
	"lukas-reineke/indent-blankline.nvim",
    'glepnir/zephyr-nvim',
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        }
    },
    -- fuzzyfinding whatever you want
    {'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { 'nvim-lua/plenary.nvim' }},
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
	'theprimeagen/harpoon',
	    -- zettelkasten plugin
	"mickael-menu/zk-nvim",
	'mbbill/undotree',
	    -- run python scripts interactively (like a notebook without using a notebook)
	    {'dccsillag/magma-nvim', run = ':UpdateRemotePlugins'},
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',
	'voldikss/vim-floaterm',
	    -- calculation plugin for vim
	'fcpg/vim-colddeck',
	'preservim/vim-markdown',
	"terrortylor/nvim-comment",
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
	"folke/zen-mode.nvim",
	"eandrju/cellular-automaton.nvim",
	'shaunsingh/nord.nvim',
	{
	    "kylechui/nvim-surround",
	    version = "*", -- Use for stability; omit to use `main` branch for the latest features
	    event = "VeryLazy",
	    config = function()
		require("nvim-surround").setup({
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
