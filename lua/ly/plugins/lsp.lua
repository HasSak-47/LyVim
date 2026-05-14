local M = {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        --helpers
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    { path = "noice.nvim",         words = { "Noice" } },
                },
            },
        },

        --Auto-completion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },

        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lua" },

        --Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
        { "HasSak-47/pest.vim" },
        -- {
        --     "ray-x/lsp_signature.nvim",
        --     event = "InsertEnter",
        --     opts = {},
        -- },
    },

    config = function()
        local wk = require("which-key")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.diagnostic.config({
            virtual_text = {
                current_line = false,
                spacing = 2
            },
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                wk.add({
                    { "K",  vim.lsp.buf.hover,           desc = "hover" },
                    { "g",  group = "goto" },
                    { "gd", vim.lsp.buf.definition,      desc = "symbol definition" },
                    { "gD", vim.lsp.buf.declaration,     desc = "symbol declaration" },
                    { "gi", vim.lsp.buf.implementation,  desc = "implementation" },
                    { "go", vim.lsp.buf.type_definition, desc = "symbol type definition" },
                    { "gr", vim.lsp.buf.references,      desc = "reference" },
                    { "gs", vim.lsp.buf.signature_help,  desc = "signature help" },
                    {
                        "<leader>lf",
                        function()
                            vim.lsp.buf.format({ bufnr = event.buf })
                        end,
                        desc = "format buffer",
                    },
                    { "<leader>lr", vim.lsp.buf.rename, desc = "rename symbol" },
                }, { buffer = event.buf })
            end,
        })
        -- TODO: keybind this
        -- vim.lsp.inlay_hint.enable(true)

        local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local default = {
            on_attach = function(client, bufnr)
                -- format on save
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
        }
        default.capabilities = capabilities

        require("mason").setup({})
        local lsps = {
            { name = 'clangd' },
            { name = 'lua_ls' },
            { name = 'tailwindcss' },
            { name = 'ts_ls' },
            { name = 'pyright' },
            { name = 'rust_analyzer' },
        }
        for _, server in ipairs(lsps) do
            local ok, config = pcall(require, "ly.plugins.lsp_config." .. (server.module or server.name))
            config = ok and config or {}
            config = vim.tbl_deep_extend('force', config, default)
            vim.lsp.config(server.name, config)
        end
        vim.lsp.enable(vim.tbl_map(function(server)
            return server.name
        end, lsps))

        vim.lsp.config('gdscript', vim.tbl_deep_extend('force', default, {
            cmd = { 'nc', 'localhost', '6008' },
            filetypes = { 'gd', 'gdscript', 'gdscript3' },
            root_markers = { 'project.godot', '.git' },
        }))

        local function godot_lsp_is_running()
            local result = vim.system({ 'nc', '-z', '127.0.0.1', '6008' }, { text = true }):wait(1000)
            return result.code == 0
        end

        local godot_lsp_warned = false
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "gd", "gdscript", "gdscript3" },
            desc = "Enable Godot LSP only for Godot buffers",
            callback = function()
                if vim.lsp.is_enabled('gdscript') then
                    return
                end

                if godot_lsp_is_running() then
                    vim.lsp.enable('gdscript')
                    godot_lsp_warned = false
                    return
                end

                if not godot_lsp_warned then
                    vim.notify("Godot LSP not running on port 6008", vim.log.levels.WARN)
                    godot_lsp_warned = true
                end
            end,
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "tailwindcss",
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
            },
        })

        local cmp = require("cmp")
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "luasnip" },
            }),
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = false,
                })
            })
        })

        require('pest-vim').setup {}
    end,
}
return M
