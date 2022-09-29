-----------------------------
-- General Neovim settings --
-----------------------------

local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

----
-- General
----
opt.mouse = 'a'
opt.swapfile = false

----
-- Neovim UI
----
opt.number = true         -- Show line number
opt.showmatch = true      -- Highlight matching brackets
opt.cursorline = true     -- Highlight the line the curor is on
opt.foldmethod = 'marker' -- Enable folding
--opt.colorcolumn = '80'    -- Line length marker at 80 columns
opt.splitright = true     -- Open vertical splits to the right
opt.splitbelow = true     -- Open horizontal splits to the bottom
opt.ignorecase = true     -- Ignore case while searching
opt.smartcase = true      -- ... unless you type in mixed-case
opt.linebreak = true      -- Wrap on word boundary
opt.termguicolors = true  -- Use 24-bit RGB colors
opt.scrolloff = 8         -- Keep 8 lines of context when scrolling vertically
opt.sidescrolloff = 8     -- ... and horizontally

----
-- Tabs and indents
----
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 4     -- An indent is 4 spaces
opt.tabstop = 4        -- A tab is 4 spaces
opt.smartindent = true -- Autoindent new lines

----
-- Performance
----
opt.lazyredraw = true -- Faster scrolling
