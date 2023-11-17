local M = {
	'folke/twilight.nvim',
	opts = {
		alpha = 0.9,
		inactive = true,
		context = 15,
	},

	init = function()
		require('twilight')
		vim.cmd('Twilight')
	end
}

return M
