local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        require('telescope').setup { defaults = {
            file_ignore_patterns = { 'build/', 'target/', '.png', '.ignore' }
        } }
    end

}

return M
