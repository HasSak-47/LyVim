local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("lilith.lsp.handlers").setup()
require "lilith.lsp.null-ls"
require "lilith.lsp.mason"
