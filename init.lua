---------------------------------------
-- This is my personal Neovim config --
---------------------------------------

-- Author: Matt Boler
-- Email: boler.matthew@gmail.com

-- Check for version compatibility
if vim.version().minor < 8 then
	vim.notify('Neovim 0.8+ required', vim.log.levels.ERROR, { title = 'Neovim Config' })
end

-- Load modules on command
local load = function(mod)
    package.loaded[mod] = nil
    require(mod)
end

------------------------------
-- Load user editor configs --
------------------------------
load('user/plugins')
load('user/options')
load('user/autocmds')
load('user/keymaps')
load('user/colors')
