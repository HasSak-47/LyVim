local status_ok, _ = pcall(require, "lspconfig") 

if not status_ok then return false end

require 'lilith.config.lsp.installer'
require 'lilith.config.lsp.handler'

return true
