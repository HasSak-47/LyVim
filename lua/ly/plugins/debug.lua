local M = {
    {
        'mfussenegger/nvim-dap',

        config = function ()
            local dap = require'dap'
            dap.configurations.c = {
            }
            
        end
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
        enabled = false,
    }
}
return M
