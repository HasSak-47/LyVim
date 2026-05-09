local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        local telescope = require('telescope')
        telescope.setup {
            defaults = {
                file_ignore_patterns = { 'build/', 'target/', '.png', '.ignore' }
            },
        }
    end

}

return M
