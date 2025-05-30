local M = {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		--helpers
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		--Auto-completion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },

		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua" },

		--Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
		{
			"ray-x/lsp_signature.nvim",
			event = "InsertEnter",
			opts = {},
		},
	},

	config = function()
		local lspconfig = require("lspconfig")

		vim.diagnostic.config({
			virtual_text = { spacing = 2 },
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local wk = require("which-key")
				local buffer = vim.lsp.buf
				--  default keymaps not included
				--  map('n', '<F2>', lsp 'buf.rename()')
				--  map('n', '<F3>', lsp 'buf.format({async = true})')
				--  map('x', '<F3>', lsp 'buf.format({async = true})')
				--  map('n', '<F4>', lsp 'buf.code_action()')
				wk.add({
					{ "K", buffer.hover, desc = "hover" },
					{ "g", group = "goto" },
					{ "gd", buffer.definition, desc = "symbol definition" },
					{ "gD", buffer.declaration, desc = "symbol declaration" },
					{ "gi", buffer.implementation, desc = "implementation" },
					{ "go", buffer.type_definition, desc = "symbol type definition" },
					{ "gr", buffer.references, desc = "reference" },
					{ "gs", buffer.signature_help, desc = "signature help" },
					{ "<leader>sf", vim.lsp.buf.format(), desc = "auto format" },
				})
			end,
		})

		local lspconfig_defaults = lspconfig.util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		require("mason").setup({})
		local mason_lsp_config = {
			ensure_installed = {
				"tailwindcss",
				"rust_analyzer",
				"ts_ls",
			},
			handlers = {
				function(server_name)
					-- local lsp_signature = require('lsp_signature')
					lspconfig[server_name].setup({
						-- on_attach = function(_, bufnr)
						--     lsp_signature.on_attach({}, bufnr)
						-- end
					})
				end,
                ts_ls = function()
                    lspconfig.ts_ls.setup{require('ly.plugins.lsp_config.ts_ls')}
                end,
				tailwindcss = function()
					lspconfig.tailwindcss.setup({})
				end,
			},
		}
		require("mason-lspconfig").setup(mason_lsp_config)

		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "luasnip" },
			}),
			mapping = cmp.mapping.preset.insert({}),
		})
	end,
}
return M
