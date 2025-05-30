local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require('nvim-treesitter.configs')
		configs.setup({
			ensure_installed = {"javascript", "typescript", "c", "cpp", "lua", "rust", "python", "vim", "vimdoc", "query"},
			sync_install = false, auto_install = true,
			highlight = { enable = true, additional_vim_regex_highlighting = false, }

		})
	end,
	lazy = false,
}

return M
