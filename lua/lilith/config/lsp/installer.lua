local status_ok, installer = pcall(require, 'mason-lspconfig')
if not status_ok then return false end

installer.setup{
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
installer.setup_handlers{
	function(name)
		require("lspconfig")[name].setup{}
	end,

	-- ["rust_analyzer"] = function()
	-- end
}

return true
