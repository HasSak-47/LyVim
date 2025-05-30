local M = {
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace" -- important for multi-folder setups
            }
        }
    }
}

return M
