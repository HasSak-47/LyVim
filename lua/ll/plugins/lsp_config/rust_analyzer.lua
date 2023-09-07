local lspconfig = require('lspconfig')
local M = {
    ['rust-analyzer'] = {
        checkOnSave = {
            allTargets = false
        },
    }

}

return M
