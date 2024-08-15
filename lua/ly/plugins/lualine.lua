local M = {
	'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function ()
        local lualine = require('lualine')
        lualine.setup{
            options = {
                disable_filetypes = {
                    statusline = { 'NvimTree', },
                },
                ignore_focus = { 'NvimTree', }
            },

        }
    end
}

return M
