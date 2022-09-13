----------------------------------------
-- Package manager configuration file --
----------------------------------------

local fn = vim.fn
local cmd = vim.cmd

-- Bootstrap the package manager if needed
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
	vim.o.runtimepath = fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Set neovim to reload whenever this file is changed
cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost packer_init.lua source <afile> | PackerSync
	augroup end
]]

-- Install plugins
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

return packer.startup(function(use)
	-- Let Packer manage itself
	use 'wbthomason/packer.nvim'
	
	-- My custom theme
	use 'mattboler/neovim-ayaru'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- Dim inactive splits
    use 'sunjon/Shade.nvim'

	-- Improved text parser
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', 
		branch = '0.1.x',
		requires = {
			{'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
		}
	}

	-- Sidebar file explorer
	use {
		'kyazdani42/nvim-tree.lua',
	  	requires = {
			{'kyazdani42/nvim-web-devicons'},
	  	},
	}

    -- Git status symbols
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'}
        }
    }
    
    ----------------------------
    -- LSP and Autocompletion --
    --                        --
    --         TODO           --
    ----------------------------
    
    local lsp_method = "none"
    
    if lsp_method == "manual" then
    ----
    -- Option 1 : Manual setup
    ----
    
    --[[
    -- LSP support
    use 'neovim/nvim-lspconfig'

    -- LSP manager
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Autocompletion engine
    use 'hrsh7th/nvim-cmp' -- Completion engine
    
    -- Autocompletion sources
    use 'hrsh7th/cmp-nvim-lsp' -- LSP plugin for CMP
    use 'hrsh7th/cmp-nvim-lsp-signature-help' -- Display method signatures
    use 'hrsh7th/cmp-buffer' -- Buffer contents
    use 'hrsh7th/cmp-path' -- File/folder paths
    use 'kdheepak/cmp-latex-symbols' -- Latex symbols

    -- Snippets
    ]]--

    elseif lsp_method == "auto" then
    ----
    -- Option 2 : Autosetup
    ----
    --[[
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
        }
    }
    ]]--
    end

	-- Let packer autoconfig if it was bootstrapped
	if packer_bootstrap then
		require('packer').sync()
	end
end)
