local M = {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
    priority = 100,
	dependencies = {
		--LSPSupport
		{'neovim/nvim-lspconfig'},--Required
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

		--Autocompletion
		{'hrsh7th/nvim-cmp'},--Required
		{'hrsh7th/cmp-nvim-lsp'},--Required
		{'L3MON4D3/LuaSnip'},--Required

		{'hrsh7th/cmp-buffer'},--Optional
		{'hrsh7th/cmp-path'},--Optional
		-- {'saadparwaiz1/cmp_luasnip'},--Optional
		-- {'hrsh7th/cmp-nvim-lua'},--Optional
		--Snippets
		-- {'rafamadriz/friendly-snippets'},--Optional
	},

	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({buffer = bufnr})
		end)

		local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        lspconfig.rust_analyzer.setup({settings = require('ly.plugins.lsp_config.rust_analyzer')})

		vim.diagnostic.config({virtual_text = true})
		lsp.setup()
	end
}

return M
