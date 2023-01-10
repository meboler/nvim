---------------------------------
-- Gitsigns Configuration File --
---------------------------------

local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
    vim.print("gitsigns not found")
    return
end

gitsigns.setup()
