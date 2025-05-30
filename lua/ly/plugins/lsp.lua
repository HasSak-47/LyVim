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

		{'hrsh7th/cmp-buffer'},--Optional
		{'hrsh7th/cmp-path'},--Optional
		{'saadparwaiz1/cmp_luasnip'},--Optional
		{'hrsh7th/cmp-nvim-lua'},--Optional
		--Snippets
		{ 'L3MON4D3/LuaSnip'},
		{'rafamadriz/friendly-snippets'},
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
			wk.add({
				{'K' , buffer.hover,           desc='hover' },
				{'g' , group='goto'},
				{'gd', buffer.definition,      desc='symbol definition'},
				{'gD', buffer.declaration,     desc='symbol declaration'},
				{'gi', buffer.implementation,  desc='implementation'},
				{'go', buffer.type_definition, desc='symbol type definition'},
				{'gr', buffer.references,      desc='reference'},
				{'gs', buffer.signature_help,  desc='signature help'},
			})
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
			handlers = { lsp.default_setup, },
		})

		local lspconfig = require('lspconfig')

		-- gdscript
		lsp.configure(
			'gdscript',
			require('ly.plugins.lsp_config.gdscript')
		)
		-- remove ltex from html files
		lsp.configure(
			'gdscript',
			require('ly.plugins.lsp_config.gdscript')
		)

		-- lsp.configure('ltex', {
		-- 	filetypes = { 'tex' , 'md'}
		-- })

        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        lspconfig.rust_analyzer.setup({settings = require('ly.plugins.lsp_config.rust_analyzer')})
        -- lspconfig.ltex.setup({settings = require('ly.plugins.lsp_config.ltex')})
        lspconfig.pyright.setup({})

        lspconfig.ts_ls.setup(require('ly.plugins.lsp_config.tsserver'))
		lspconfig.arduino_language_server.setup({cmd = {
		   "arduino-language-server",
		   "-cli-config", "/home/lilith/Arduino/config.yaml",
		   "-fqbn", "arduino:uvr:uno",
		   "-clangd", "/usr/bin/clangd"
		}})

        local cmp = require('cmp')
		local cmp_action = require('lsp-zero').cmp_action()
		local luasnip = require('luasnip')
		require('luasnip.loaders.from_vscode').lazy_load()

		cmp.setup{
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
            sources = cmp.config.sources({
                {name = 'nvim_lsp'},
                {name = 'buffer'},
                {name = 'luasnip'},
           }),
        }

		lsp.setup()
	end
}

return M
