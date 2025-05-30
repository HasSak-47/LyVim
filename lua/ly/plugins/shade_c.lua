local M = {
	'sunjon/shade.nvim',
	init = function()
		require('shade').setup({
			opacity_step = 1,
			ovelay_opacity = 1,
		})
	end
}

return M
