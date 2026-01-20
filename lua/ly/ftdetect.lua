vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.gdsl",
    callback = function()
        vim.bo.filetype = "gdsl"
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.nb",
    callback = function()
        vim.bo.filetype = "niebo"
    end,
})
