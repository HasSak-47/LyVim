local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "rebelot/kanagawa.nvim",
    },
    lazy = false,
    config = function()
        local lualine = require("lualine")
        local noice =require("noice");
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
                lualine_c = { "filename",{
                    noice.api.status.mode.get,
                    cond = noice.api.status.mode.has,
                    color = { fg = "#ff9e64" },
                }},

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
