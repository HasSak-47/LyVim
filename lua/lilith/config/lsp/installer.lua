local status_ok, installer = pcall(require, 'mason-lspconfig')
if not status_ok then return false end

local installed = {
	'rust_analyzer',
	'sumneko_lua',
	'clangd',
	'cmake',
	'html',
	'tsserver',
	'ltex',
	'pyright'
}

local configs = {}
for _, v in pairs(installed) do
	local f = string.format('lilith.config.lsp.settings.%s', v)
	local ok, m = pcall(require, f)
	if ok then
		table.insert(configs, v, m)
	end
end

installer.setup{
	ensure_installed = installed
}

installer.setup_handlers{
	function(name)
		require("lspconfig")[name].setup{}
	end,

	["rust_analyzer"] = function()

	end
}

return true
