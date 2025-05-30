local M = {
    settings = {
        Lua = {
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
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
}

return M
