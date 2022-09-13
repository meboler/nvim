----------------------------------------
-- Nvim-Treesitter Configuration File --
----------------------------------------

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

nvim_treesitter.setup({
	ensure_installed = {
		'bash',
		'bibtex',
		'c',
		'cmake',
		'cpp',
		'julia',
		'latex',
		'lua',
		'make',
		'markdown',
		'python',
		'vim',
		'yaml',
	},
	highlight = {
		enable = true,
	},
})
