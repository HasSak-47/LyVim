local M = {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            local languages = {
                "javascript",
                "typescript",
                "c",
                "cpp",
                "lua",
                "rust",
                "python",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
            }

            ts.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            ts.install(languages)

            local group = vim.api.nvim_create_augroup("ly_treesitter", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        lazy = false,
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
        },
        init = function()
            vim.g.no_plugin_maps = true
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                    selection_modes = {
                        ["@function.outer"] = "V",
                        ["@class.outer"] = "V",
                        ["@parameter.outer"] = "v",
                    },
                },
                move = {
                    set_jumps = true,
                },
            })

            local select = require("nvim-treesitter-textobjects.select")
            vim.keymap.set({ "x", "o" }, "af", function()
                select.select_textobject("@function.outer", "textobjects")
            end, { desc = "function outer" })
            vim.keymap.set({ "x", "o" }, "if", function()
                select.select_textobject("@function.inner", "textobjects")
            end, { desc = "function inner" })
            vim.keymap.set({ "x", "o" }, "ac", function()
                select.select_textobject("@class.outer", "textobjects")
            end, { desc = "class inner" })
            vim.keymap.set({ "x", "o" }, "ic", function()
                select.select_textobject("@class.inner", "textobjects")
            end, { desc = "class outer" })
            vim.keymap.set({ "x", "o" }, "aa", function()
                select.select_textobject("@parameter.outer", "textobjects")
            end, { desc = "param outer" })
            vim.keymap.set({ "x", "o" }, "ia", function()
                select.select_textobject("@parameter.inner", "textobjects")
            end, { desc = "param inner" })
        end,
    },
}


return M
