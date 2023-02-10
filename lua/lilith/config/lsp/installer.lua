local status_ok, lsp_installer = pcall(require, 'mason-lspconfig')
if not status_ok then return false end

lsp_installer.setup{
	ensure_installed = {
		'rust_analyzer',
		'sumneko_lua',
		'clangd',
		'cmake',
		'html',
		'tsserver',
		'ltex',
		'pyright',
		'pyright'
	}
}

return true
