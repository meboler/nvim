-------------
-- Keymaps --
-------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Set the leader key as space
vim.g.mapleader = ' '

----
-- Neovim-specific keybinds
----

-- Fix motion around wraps
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true } )
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true } )

-- Open/Close built-in terminal
map('n', '<leader>t', ':terminal<CR>')
map('t', '<Esc>', '<C-\\><C-n>')

-- Emergency exit command
map('n', '<leader>q', ':qa!<CR>')

----
-- Plugin keybinds
----

-- Telescope
map('n', '<leader>sf', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], {desc='[S]earch by [F]ile'})
map('n', '<leader>sg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], {desc='[S]earch by [G]rep'})

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>')
