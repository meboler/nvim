---------------------------------
-- LSP-Zero Configuration File --
---------------------------------

local status_ok, lspzero = pcall('require', 'lsp-zero')
if not status_ok then
    return
end

-- Use default settings for now
lspzero.preset('recommended')

-- Apply settings
lspzero.setup()
