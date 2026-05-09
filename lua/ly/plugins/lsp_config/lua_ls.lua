local M = {
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".git",
        "init.lua",
    },
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
            diagnostics = {
                globals = { "vim" },
            },
            hover = {
                previewFields = 300,
                enumsLimit = 100,
                viewStringMax = 4000,
            },
            format = {
                enable = true,
                defaultConfig = {
                    quote_style = 'single',
                    max_line_length = 80,
                },
            },
            runtime = {
                version = "LuaJIT",
                path = {
                    "lua/?.lua",
                    "lua/?/init.lua",
                },
            },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}

return M
