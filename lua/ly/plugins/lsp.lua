local M = {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        --helpers
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

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
                local wk = require("which-key")
                local buffer = vim.lsp.buf
                wk.add({
                    { "K",          buffer.hover,           desc = "hover" },
                    { "g",          group = "goto" },
                    { "gd",         buffer.definition,      desc = "symbol definition" },
                    { "gD",         buffer.declaration,     desc = "symbol declaration" },
                    { "gi",         buffer.implementation,  desc = "implementation" },
                    { "go",         buffer.type_definition, desc = "symbol type definition" },
                    { "gr",         buffer.references,      desc = "reference" },
                    { "gs",         buffer.signature_help,  desc = "signature help" },
                    { "<leader>lf", vim.lsp.buf.format({}), desc = "auto format" },
                })
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

        require("mason").setup({})
        local lsps = { 'clangd', 'lua_ls', 'tailwindcss', 'tsserver', 'pyright', 'rust_analyzer' }
        for _, value in ipairs(lsps) do
            local config = require("ly.plugins.lsp_config." .. value)
            config = vim.tbl_deep_extend('force', config, default)
            vim.lsp.config[value] = config
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        vim.lsp.config('gdscript', {
            cmd = { 'nc', 'localhost', '6008' }, -- Godot LSP server port
            filetypes = { 'gd', 'gdscript' },
            root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
            capabilities = capabilities,
        })

        -- Enable it
        local function wait_for_port(host, port, timeout)
            local t0 = os.time()
            while os.time() - t0 < timeout do
                local handle = io.popen(("nc -z %s %d"):format(host, port))
                if handle == nil then
                    return false
                end
                local result = handle:read("*a")
                handle:close()
                if result == "" then return true end
                vim.wait(500)
            end
            return false
        end

        if wait_for_port("127.0.0.1", 6008, 5) then
            vim.lsp.enable('gdscript')
        else
            vim.notify("Godot LSP not running on port 6008", vim.log.levels.WARN)
        end

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
