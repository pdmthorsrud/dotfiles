-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    --    use({
    --        'rose-pine/neovim',
    --        as = 'rose-pine',
    --        config = function()
    --            vim.cmd('colorscheme rose-pine')
    --        end
    --    })
    --
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('voldikss/vim-floaterm')
    use {
      'kosayoda/nvim-lightbulb',
      requires = 'antoinemadec/FixCursorHold.nvim',
    }
    use "terrortylor/nvim-comment"
    require('nvim_comment').setup()


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
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

use("folke/zen-mode.nvim")
use("github/copilot.vim")
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
