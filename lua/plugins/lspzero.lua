--------------------------------
-- LspZero Configuration File --
--------------------------------

local status_ok, lspzero = pcall(require, 'lsp-zero')
if not status_ok then
    return
end

lspzero.preset('recommended')

lspzero.setup()
