local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function config()
    local null_ls = require("null-ls")

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.prettierd.with({
                extra_filetypes = { "html", "css", "javascript", "typescript", "svelte" },
            }),
            null_ls.builtins.formatting.black,
        },

        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = autogroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = autogroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,
    })
end

local M = {
    "nvimtools/none-ls.nvim",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "nvim-lua/plenary.nvim" },
    },
    config = config,
}

return M
