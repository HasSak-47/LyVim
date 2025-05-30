local M = {
	'rcarriga/nvim-notify',
	lazy = false,
	config = function()
		vim.notify = require('notify')
	end
}

return M
