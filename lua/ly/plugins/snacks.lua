local M = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = {
            enabled = false,
        },
        indent = { enabled = false },
        input = { enabled = true },
        picker = {
            enabled = false,
        },
        notifier = {
            enabled = true,
            timeout = 5000,
            level = vim.log.levels.WARN,

        },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}

return M;
