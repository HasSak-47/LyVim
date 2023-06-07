-- local nvim_lsp = require'lspconfig'
-- 
-- local on_attach = function(client)
--     require'completion'.on_attach(client)
-- end
-- 
-- nvim_lsp.rust_analyzer.setup({
--     on_attach=on_attach,
--     settings = {
--         ["rust-analyzer"] = {
-- 			check = {
-- 				allTargets = false,
-- 				extraArgs = {'fucker'}
-- 			},
--         }
--     }
-- })


local servers = {
--	"lua_language_server",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"rust_analyzer",
	"clangd",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(servers) do
	local opts = {
		on_attach    = function(client, bfnr) print(client) end, --require("lilith.lsp.handlers").on_attach,
		capabilities = require("lilith.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	lspconfig[server].setup(opts)
end
