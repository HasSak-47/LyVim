local status_ok, _ = pcall(require, "lspconfig") 

if not status_ok then
	print("lilith::config::lsp::init not working")
	return false
end

local inst_ok, _ = pcall require 'lilith.config.lsp.installer'
local hand_ok, _ = pcall require 'lilith.config.lsp.handler'

if not inst_ok then
	print('lilith::config::lsp::installer not woring')
end
if not hand_ok then
	print('lilith::config::lsp::handler not woring')
end

return true
