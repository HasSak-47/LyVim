local M = {
    "folke/snacks.nvim",
    priority = 2000,
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
                title = "Git Blame",
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
            opts = {
                left = { "mark", "sign" }, -- priority of signs on the left (high to low)
                right = { "fold", "git" }, -- priority of signs on the right (high to low)
                folds = {
                    open = false,          -- show open fold icons
                    git_hl = false,        -- use Git Signs hl for fold icons
                },
                git = {
                    -- patterns to match Git signs
                    patterns = { "GitSign", "MiniDiffSign" },
                },
                refresh = 50, -- refresh at most every 50ms
            }
        },
        words = { enabled = true },
    },
}

return M;
