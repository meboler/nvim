local opt = vim.opt
local cmd = vim.cmd

-- Enable mouse interaction
opt.mouse = 'a'
-- Disable autosave artifact files
opt.swapfile = false 
-- Show line numbers
opt.number = true
-- Highlight the row the cursor is on
opt.cursorline = true
-- Ignore case while searching
opt.ignorecase = true
-- ... unless searching for a mixed-case string
opt.smartcase = true
-- Disable highlighting search matches
opt.hlsearch = false
-- Wrap long lines
opt.wrap = true
-- Wrap on word boundaries
opt.linebreak = true
-- Preserve indentation of wrapped lines
opt.breakindent = true
-- Open vertical splits to the right
opt.splitright = true
-- Open horizontal splits to the bottom
opt.splitbelow = true
-- Keep 8 lines of context when scrolling vertically
opt.scrolloff = 8
-- ... and horizontally
opt.sidescrolloff = 8
-- Use spaces instead of tabs
opt.expandtab = true
-- An indent is four spaces
opt.shiftwidth = 4
-- A tab is four spaces
opt.tabstop = 4
-- Autoindent new lines
opt.smartindent = true
-- Better terminal color support
opt.termguicolors = true

-- Set other options
local colorscheme = require("helpers.colorscheme")
cmd.colorscheme(colorscheme)
