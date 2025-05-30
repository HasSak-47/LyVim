local M = {
    'folke/which-key.nvim',
    init = function ()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require('which-key')

		wk.setup({})
    end,
}

return M
