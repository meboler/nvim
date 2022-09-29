--------------------------------
-- Lualine Configuration File --
--------------------------------

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

lualine.setup({
    options = {
        theme = 'ayu',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    extensions = {
        'nvim-tree'
    }
})
