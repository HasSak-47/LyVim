local M = {
	"rebelot/kanagawa.nvim",
    priority = 100,
	config = function()
		require('kanagawa').setup({
			transparent = true,
		})
		vim.cmd("colorscheme  kanagawa")
	end
}

return M
