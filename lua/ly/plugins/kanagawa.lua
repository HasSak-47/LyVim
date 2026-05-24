local M = {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
        require("kanagawa").setup({
            transparent = true,
            overrides = function(colors)
                ---@type ThemeColors
                local theme = colors.theme
                return {
                    -- Noice
                    MyKaNormalFloat = { bg = "None", fg = theme.ui.float.fg_border},
                    MyKaFloatBorder = { bg = "None", fg = theme.ui.float.fg_border},
                    MyKaFloatTitle  = { bg = "None", bold = true, fg = theme.ui.float.fg},

                    -- telescope
                    TelescopeTitle         = { bold = true, fg = theme.ui.special },
                    TelescopePromptNormal  = { bg = "NONE", fg = theme.ui.float.fg},
                    TelescopePromptBorder  = { bg = "NONE", fg = theme.ui.float.fg},
                    TelescopeResultsNormal = { bg = "NONE", fg = theme.ui.float.fg},
                    TelescopeResultsBorder = { bg = "NONE", fg = theme.ui.float.fg_border},
                    TelescopePreviewNormal = { bg = "NONE" },
                    TelescopePreviewBorder = { bg = "NONE", fg = theme.ui.float.fg_border},
                }
            end,
        })
        vim.cmd("colorscheme kanagawa")

    end,
}

return M
