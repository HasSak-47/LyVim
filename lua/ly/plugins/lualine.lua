local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "rebelot/kanagawa.nvim",
    },
    lazy = false,
    config = function()
        local lualine = require("lualine")
        lualine.setup({
            options = {
                disable_filetypes = {
                    statusline = { "NvimTree", "neo-tree" },
                    winbar = { "NvimTree", "neo-tree" },
                },
                ignore_focus = { "NvimTree" },
                theme = 'kanagawa'
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename", },

                lualine_x = { "encoding", 'fileformat', 'filetype' },
                lualine_y = { "lsp_status" },
                lualine_z = { "location" },
            },
            extensions = {
                "neo-tree"
            }
        })
    end,
}

return M
