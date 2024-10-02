local M = {
	'rcarriga/nvim-notify',
	lazy = false,
	config = function()
        local notify = require('notify')
        notify.setup({
            level = vim.log.levels.WARN
        })
		vim.notify = notify

	end
}

return M
