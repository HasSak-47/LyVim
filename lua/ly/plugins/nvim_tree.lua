local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require('nvim-tree').setup({
            view = {width = 20},
            sort_by = "extension",
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
        })
    end
}

return M
