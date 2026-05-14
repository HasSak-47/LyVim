local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function config()
    local null_ls = require("null-ls")
    local helpers = require("null-ls.helpers")
    local utils = require("null-ls.utils")

    local prettier_root = function(bufname)
        return utils.root_pattern(".prettierrc.toml")(bufname) or utils.cosmiconfig("prettier")(bufname)
    end

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.prettierd.with({
                extra_filetypes = { "html", "css", "javascript", "typescript", "svelte" },
                cwd = helpers.cache.by_bufnr(function(params)
                    return prettier_root(params.bufname)
                end),
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
