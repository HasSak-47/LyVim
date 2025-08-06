local M = {
    "folke/which-key.nvim",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")

        wk.setup({})

        wk.add({
            { "j",          "gj",                       desc = "move j" },
            { "k",          "gk",                       desc = "move k" },

            { "<C-j>",      "<C-W>j",                   desc = "change to bottom window" },
            { "<C-k>",      "<C-W>k",                   desc = "change to top window" },
            { "<C-l>",      "<C-W>l",                   desc = "change to left window" },
            { "<C-h>",      "<C-W>h",                   desc = "change to right window" },

            { "<C-A-j>",    ":resize -2<CR>",           desc = "resize window" },
            { "<C-A-k>",    ":resize +2<CR>",           desc = "resize window" },
            { "<C-A-l>",    ":vertical resize -2<CR>",  desc = "resize window" },
            { "<C-A-h>",    ":vertical resize +2<CR>",  desc = "resize window" },

            { "<leader>u",  ":UndotreeToggle<CR>",      desc = "toggles undo tree" },

            { "<leader>a",  group = "aesthetic" },
            { "<leader>at", ":Twilight<CR>",            desc = "toggle twilight" },
            { "<leader>ar", ":set relativenumber!<CR>", desc = "toggle relnum" },

            { "<leader>l",  group = "lsp stuff" },
        })

        local hm_ok, harpoon = pcall(require, "harpoon")
        if hm_ok then
            wk.add({
                { "<leader>h", group = "harpoon" },
                {
                    "<leader>ha",
                    function()
                        harpoon:list():add()
                    end,
                    desc = "add file",
                },
                {
                    "<leader>hu",
                    function()
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    desc = "toggle quick menu",
                },
            })
        end

        local b_ok, builtin = pcall(require, "telescope.builtin")
        if b_ok then
            wk.add({
                { "<leader>t",  group = "telescope" },
                { "<leader>tf", builtin.find_files, desc = "find files" },
                { "<leader>tg", builtin.git_files,  desc = "find git files" },
            })
        end

        local t_ok, nvim_tree = pcall(require, "nvim-tree.api")
        if t_ok then
            wk.add({ "<leader>e", nvim_tree.tree.toggle, desc = "explorer" })
        end

        local trouble_ok, trouble = pcall(require, "trouble")
        if trouble_ok then
            wk.add({
                { "<leader>x", group = "troule" },
                {
                    "<leader>xt",
                    function()
                        trouble.toggle("diagnostics")
                    end,
                    desc = "open trouble",
                },
            })
        end
    end,
}

return M
