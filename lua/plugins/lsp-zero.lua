---------------------------------
-- Lsp-Zero Configuration File --
---------------------------------

local status_ok, lsp = pcall(require, 'lsp-zero')
if not status_ok then
    return
end

lsp.preset('recommended')

--[[
    Uncomment if you want to pass specifc args to an LS
    lsp.configure()
]]--

lsp.setup()

