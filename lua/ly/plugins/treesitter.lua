local M = {
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
}

return M
