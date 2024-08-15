local M = {
	'folke/twilight.nvim',
	opts = {
		alpha = 0.9,
		inactive = true,
		context = 15,
	},

	config = function()
		require('twilight').setup({
			dimming = {
				alpha = 0.25,
				term_bg = "#000000"
			},
			treesitter = true,
		})
	end
}

return M
