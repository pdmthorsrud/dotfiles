-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')


return require('packer').startup(function(use)
    use "~/dbt_compile"
    use "github/copilot.vim"
    -- indentation guidelines
    use "lukas-reineke/indent-blankline.nvim"
    -- fuzzyfinding whatever you want
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- just a normal theme
    use({
      'glepnir/zephyr-nvim',
      requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
    })
    -- autowrapping
    use({
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup()
        end,
    })
    -- lsp config
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    -- switch quickly between files
    use(
        {
            'theprimeagen/harpoon',
            branch = 'harpoon2'
        }
    )
    -- zettelkasten plugin
    use('mbbill/undotree')
    -- run python scripts interactively (like a notebook without using a notebook)
    use{'dccsillag/magma-nvim', run = ':UpdateRemotePlugins'}
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    use('voldikss/vim-floaterm')
    -- calculation plugin for vim
    use('fcpg/vim-colddeck')
    use('preservim/vim-markdown')
    -- yank github links for any file
    use {
      'ruifm/gitlinker.nvim',
      requires = 'nvim-lua/plenary.nvim',
    }
    -- use('luk400/vim-jukit')
    -- search specific directories using telescope
    use({
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
    })
    -- fairly unfinished dbt plugin
    use {'PedramNavid/dbtpal',
      config = function()
          local dbt = require('dbtpal')
          dbt.setup {
            -- Path to the dbt executable
            path_to_dbt = "dbt",

            -- Path to the dbt project, if blank, will auto-detect
            -- using currently open buffer for all sql,yml, and md files
            path_to_dbt_project = "",

            -- Path to dbt profiles directory
            path_to_dbt_profiles_dir = vim.fn.expand "~/.dbt",

            -- Search for ref/source files in macros and models folders
            extended_path_search = true,

            -- prevent modifying sql files in target/(compiled|run) folders
            protect_compiled_files = true

          }

          -- Setup key mappings

          vim.keymap.set('n', '<leader>drf', dbt.run)
          vim.keymap.set('n', '<leader>drp', dbt.run_all)
          vim.keymap.set('n', '<leader>dtf', dbt.test)
          vim.keymap.set('n', '<leader>dm', require('dbtpal.telescope').dbt_picker)

          -- Enable Telescope Extension
          require'telescope'.load_extension('dbtpal')
          end,
      requires = { { 'nvim-lua/plenary.nvim' }, {'nvim-telescope/telescope.nvim'} }
    }
    use ({
      "terrortylor/nvim-comment",
      config = function()
          require('nvim_comment').setup()
        end,
    })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
                {                                      -- Optional
                    'williamboman/mason.nvim',
                    run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                    end,
                },
                {'williamboman/mason-lspconfig.nvim'}, -- Optional

                -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'SirVer/ultisnips'},     -- Required
            {'quangnguyen30192/cmp-nvim-ultisnips'}     -- Required
        }
    }

  use("folke/zen-mode.nvim")
  use("RRethy/vim-illuminate")
  use("eandrju/cellular-automaton.nvim")
  use{
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'nvim-tree/nvim-web-devicons'

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'shaunsingh/nord.nvim'

  use({ "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'folke/tokyonight.nvim'
  use 'ggandor/leap.nvim'
  use {
      'pwntester/octo.nvim',
      requires = {
          'nvim-lua/plenary.nvim',
          'nvim-telescope/telescope.nvim',
          'kyazdani42/nvim-web-devicons',
      }
  }
  end)
