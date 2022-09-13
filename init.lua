---------------------------------------
-- This is my personal Neovim config --
---------------------------------------

-- Author: Matt Boler
-- Email:  failtolaunch28@gmail.com

if vim.version().minor < 7 then
	vim.notify('Neovim 0.7+ required', vim.log.levels.ERROR, { title = 'Neovim Config' })
end

---------------------------------------
-- Load plugins before anything else --
---------------------------------------
require('packer_init')

------------------------------
-- Load core editor configs --
------------------------------
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/colors')

-------------------------
-- Load plugin configs --
-------------------------
require('plugins/gitsigns')
require('plugins/lualine')
require('plugins/nvim_tree')
require('plugins/shade')
require('plugins/telescope')
require('plugins/treesitter')
