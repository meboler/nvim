------------------------------------------
-- Plugin Management Configuration File --
------------------------------------------

-- Bootstrap the package manager if needed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local boostrap_packer = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print('Installing packer...')
    local packer_repo_url = 'https://github.com/wbthomason/packer.nvim'
    vim.fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        packer_repo_url,
        install_path
    })
    print('Done.')
    vim.cmd('packadd packer.nvim')
    boostrap_packer = true
end

-- Install plugins
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Load a config file for a plugin with error safety
local configure = function(path)
    pcall(require, path)
end

packer.startup(function(use)
    -- Package Manager
	use 'wbthomason/packer.nvim'

    -- LSP Configuration & Plugins
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Status updates for LSPs
            'j-hui/fidget.nvim',

            -- Additional lua configs
            'folke/neodev.nvim'
        }
    }

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    }

    -- Highlight, edit, and navigate code
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update {with_sync = true})
        end,
        config = configure('plugins.treesitter')
    }

    -- Additional text objects for treesitter
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter'
    }

    -- Custom themes
    use 'nyoom-engineering/oxocarbon.nvim'

    -- Pretty statusline
    use {
        'nvim-lualine/lualine.nvim',
        config = configure('plugins.lualine'),
    }

    -- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = {
			{'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
		},
        config = configure('plugins.telescope'),
	}

    -- File explorer
	use {
		'kyazdani42/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = configure('plugins.nvim-tree'),
	}

end)

if boostrap_packer then
    packer.sync()
end
