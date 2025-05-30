local M = {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
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
			local wk = require('which-key')
			local buffer = vim.lsp.buf
			--  default keymaps not included
			--  map('n', '<F2>', lsp 'buf.rename()')
			--  map('n', '<F3>', lsp 'buf.format({async = true})')
			--  map('x', '<F3>', lsp 'buf.format({async = true})')
			--  map('n', '<F4>', lsp 'buf.code_action()')
			wk.register({
				K = { buffer.hover, 'hover' },
				g = {
					name = 'goto',
					d = { buffer.definition, 'symbol definition'},
					D = { buffer.declaration, 'symbol declaration'},
					i = { buffer.implementation, 'implementation'},
					o = { buffer.type_definition, 'symbol type definition'},
					r = { buffer.references, 'reference'},
					s = { buffer.signature_help, 'signature help'},
				}
			})
		end)

		-- mason goes here if broken
		-- if not broken do not fucking bother
		local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        lspconfig.rust_analyzer.setup({settings = require('ly.plugins.lsp_config.rust_analyzer')})
        lspconfig.ltex.setup({settings = require('ly.plugins.lsp_config.ltex')})

		vim.diagnostic.config({virtual_text = true})

        local cmp = require('cmp')

        cmp.setup{
            sources = {
                {name = 'nvim_lsp'},
                {name = 'buffer'},
            }
        }

		lsp.setup()
	end
}

return M
