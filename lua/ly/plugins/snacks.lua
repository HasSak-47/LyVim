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
        git = {
            enabled = true,
            blame_line = {
                width = 0.6,
                height = 0.6,
                border = true,
                title = " Git Blame ",
                title_pos = "center",
                ft = "git",
            },
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
        statuscolumn = {
            enabled = false,
        },
        words = { enabled = true },
    },
}

return M;
