--------------------------------
-- LspZero Configuration File --
--------------------------------

local status_ok, lspzero = pcall(require, 'lsp-zero')
if not status_ok then
    return
end

lspzero.preset('recommended')

-- Add latex symbols to sources
local cmp_sources = lspzero.defaults.cmp_sources()

table.insert(cmp_sources, {name = 'latex_symbols'})

lspzero.setup_nvim_cmp({
    sources = cmp_sources
})

lspzero.setup()
