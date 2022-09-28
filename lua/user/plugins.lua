------------------------------------------
-- Plugin Management Configuration File --
------------------------------------------

---
-- Usage:
---

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
    --vim.o.runtimepath = fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
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
    -- Let packer manage itself
	use 'wbthomason/packer.nvim'

    -- My custom theme
    use 'mattboler/neovim-ayaru'

    -- Pretty statusline
    use {
        'nvim-lualine/lualine.nvim',
        config = configure('plugins.lualine'),
    }

    -- Indent guides
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = configure('plugins.indent-blankline'),
    }

    -- Dim inactive windows
    use {
        'sunjon/Shade.nvim',
        config = configure('plugin.shade'),
    }

    -- Better text parsing
    use {
        'nvim-treesitter/nvim-treesitter',
        config = configure('plugins.treesitter'),
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

    -- Git status symbols
    use {
        'lewis6991/gitsigns.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
		},
        config = configure('plugins.gitsigns'),
    }

    -- File explorer
	use {
		'kyazdani42/nvim-tree.lua',
	  	requires = {
			{'kyazdani42/nvim-web-devicons'},
	  	},
        config = configure('plugins.nvim-tree'),
	}

    -- Terminal management
    use {
        'akinsho/toggleterm.nvim',
        config = configure('plugins.toggleterm'),
    }

    -- Autocompletion
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        },
        config = configure('plugins.lsp-zero'),
    }

end)

if boostrap_packer then
    packer.sync()
end
