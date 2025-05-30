local plugins = {
	'telescope',
	'kanagawa',
	'treesitter',
	'undotree',
	'lsp',
	'harpoon',
    'nvim_tree',
    'which_key',
	'twilight',
	'shade_c',
	'project_man',
    'indent',
}

local M = {}
for _, plugin_name in ipairs(plugins) do
	local path = string.format('ly.plugins.%s', plugin_name)
	table.insert(M, require(path))
end

return M
