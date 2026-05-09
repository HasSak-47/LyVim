local M = {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
        require("kanagawa").setup({
            transparent = true,
            overrides = function(colors)
                return {
                    -- base float groups; kanagawa keeps these opaque unless you override them
                    NormalFloat = { bg = "NONE" },
                    FloatBorder = { bg = "NONE" },
                    FloatTitle = { bg = "NONE" },

                    -- telescope
                    TelescopeTitle = { bold = true },
                    TelescopePromptNormal = { bg = "NONE" },
                    TelescopePromptBorder = { bg = "NONE" },
                    TelescopeResultsNormal = { bg = "NONE" },
                    TelescopeResultsBorder = { bg = "NONE" },
                    TelescopePreviewNormal = { bg = "NONE" },
                    TelescopePreviewBorder = { bg = "NONE" },
                }
            end,
        })
        vim.cmd("colorscheme kanagawa")
    end,
}

return M
