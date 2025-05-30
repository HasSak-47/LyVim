local M = {
    'mhartington/formatter.nvim',
	dependencies = {
	    'neovim/nvim-lspconfig',
    },
    config = function()
        require('formatter').setup{
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = { },
        }
    end
}

return M
