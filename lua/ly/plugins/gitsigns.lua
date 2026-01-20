local M = {
    'lewis6991/gitsigns.nvim',
    enabled = true,

    config = function()
        local gitsigns = require('gitsigns')

        gitsigns.setup {}

        local group = vim.api.nvim_create_augroup("GitsignsRefresh", { clear = true })
        vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "TermClose", "VimResume" }, {
            group = group,
            desc = "Refresh gitsigns after external git changes",
            callback = function()
                pcall(gitsigns.refresh)
            end,
        })
    end
}

return M
