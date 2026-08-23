-- -----------------------------------------------------------------------------------------------
-- General configuration
-- Source: https://gist.github.com/carderne/0dc6eb6ecc48a25192687ab533f71cc7
-- -----------------------------------------------------------------------------------------------
-- Basic settings
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.spelllang = "en_us"
vim.opt.title = true
vim.opt.titlestring = "nvim"

-- Leader (this is here so plugins etc pick it up)
vim.g.mapleader = " "

-- use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use system clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Display settings
vim.opt.termguicolors = true
vim.o.background = "dark"

-- Scrolling and UI settings
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

-- Persist undo (persists your undo history between sessions)
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true

-- Tab stuff
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search configuration
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- open new split panes to right and below (as you probably expect)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- -----------------------------------------------------------------------------------------------
-- Plugin list
-- -----------------------------------------------------------------------------------------------
local plugins = {
    { "gbprod/nord.nvim" },                                  -- Nord theme
    { "nyoom-engineering/oxocarbon.nvim", build = false },   -- Oxocarbon theme
    
    -- better syntax highlighting
    { "nvim-treesitter/nvim-treesitter", priority = 1000, build = ":TSUpdate" },

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end,
    },

    -- file browser
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
        end,
    },

    -- fuzzy search menu
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            require("telescope").setup()
        end,
    },
    
    -- start screen
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local startify = require("alpha.themes.startify")
            -- available: devicons, mini, default is mini
            -- if provider not loaded and enabled is true, it will try to use another provider
            startify.file_icons.provider = "devicons"
            require("alpha").setup(
                startify.config
            )
        end,
    },
}

-- -----------------------------------------------------------------------------------------------
-- Plugin installation
-- -----------------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins)

-- -----------------------------------------------------------------------------------------------
-- Plugin config
-- -----------------------------------------------------------------------------------------------
vim.cmd.colorscheme("oxocarbon")     -- activate the theme

-- -----------------------------------------------------------------------------------------------
-- Treesitter (syntax highlighting and related stuff!)
-- -----------------------------------------------------------------------------------------------
-- NB: Make sure to add more from this list!
-- https://github.com/nvim-treesitter/nvim-treesitter/tree/master#supported-languages
require("nvim-treesitter.config").setup({
    ensure_installed = {}, -- Fill in where relevant
    sync_install = false,
    auto_install = true,
    highlight = { enable = true, },
})
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- -----------------------------------------------------------------------------------------------
-- Keymap settings
-- -----------------------------------------------------------------------------------------------
-- Basic keys
vim.keymap.set("n", "<space>", ":")  -- hit <space> to start a command, quicker than :
vim.keymap.set("n", "q", "<C-r>")    -- "u" is undo, I map "q" to redo

-- Search navigation
-- n is always forward, N is always backward
-- ' is now forward and ; is backward
vim.keymap.set("n", "n", "v:searchforward ? 'n' : 'N'", { expr = true })
vim.keymap.set("n", "N", "v:searchforward ? 'N' : 'n'", { expr = true })
vim.keymap.set({ "n", "v" }, ";", "getcharsearch().forward ? ',' : ';'", { expr = true })
vim.keymap.set({ "n", "v" }, "'", "getcharsearch().forward ? ';' : ','", { expr = true })

-- toggle line numbers and wrap
vim.keymap.set("n", "<leader>n", ":set nonumber! relativenumber!<CR>")
vim.keymap.set("n", "<leader>w", ":set wrap! wrap?<CR>")

-- Moving between splits and resizing
vim.keymap.set("n", "<C-j>", "<C-W><C-J>")  -- use Ctrl-j (and so on) to move between splits
vim.keymap.set("n", "<C-k>", "<C-W><C-K>")
vim.keymap.set("n", "<C-l>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- nvim-tree (file browser settings)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Fuzzy finding
local tele_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tele_builtin.git_files, {})  -- ff to find git files
vim.keymap.set("n", "<leader>fa", tele_builtin.find_files, {}) -- fa to find any files
vim.keymap.set("n", "<leader>fg", tele_builtin.live_grep, {})  -- fg to ripgrep
vim.keymap.set("n", "<leader>fb", tele_builtin.buffers, {})    -- fb to see recent buffers
vim.keymap.set("n", "<leader>fh", tele_builtin.help_tags, {})  -- fh to search help
