local M = {
	"rebelot/kanagawa.nvim",
    priority = 100,
	config = function()
		require('kanagawa').setup({
			transparent = true,
		})
		vim.cmd("colorscheme  kanagawa")

		local _, _ = pcall(require,'twilight')
	end
}

return M
