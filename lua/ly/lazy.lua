local plugins = {
	'telescope',
	'kanagawa',
	'treesitter',
	'undotree',
	'lsp',
	'harpoon',
    'nvim_tree',
    'which_key',
    -- 'indent'
}

local M = {}
for _, plugin_name in ipairs(plugins) do
	local path = string.format('ly.plugins.%s', plugin_name)
	table.insert(M, require(path))
end

return M
