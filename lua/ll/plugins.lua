local M = {
	{
		"nvim-telescope/telescope.nvim" , tag = '0.1.2',
		dependencies = {'nvim-lua/plenary.nvim'}
	},
	{
		"rebelot/kanagawa.nvim",
		config = function() 
			kanagawa = require('kanagawa')
			kanagawa.setup({
				transparent = true
			})

			vim.cmd('colorscheme kanagawa')

		end,	

	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function() 
			local configs = require('nvim-treesitter.configs')
			configs.setup({
				ensure_installed = {"javascript", "typescript", "c", "lua", "rust", "python", "vim", "vimdoc", "query"},
				sync_install = false, auto_install = true,
				highlight = { enable = true, additional_vim_regex_highlighting = false, }
			})
		end,
		lazy = false,
	},
	-- harpoon
	-- undotree
	{ "mbbill/undotree" },
	-- lsp
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},	         -- Required
			{'williamboman/mason.nvim'},	       -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional
		
			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
}

return M
