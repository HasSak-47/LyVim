local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
	print("lilith::config::lsp::init.lua lspconfig not working :c")
	return
end

require("lilith.config.lsp.installer")
require("lilith.config.lsp.handlers").setup()
