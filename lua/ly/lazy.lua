local plugins = {
	'lsp',
	'telescope',
	'kanagawa',
	'treesitter',
	'undotree',
	'harpoon',
    'nvim_tree',
    'which_key',
	-- 'twilight',
	-- 'shade',
	'project',
    'indent',
	'copilot',
	-- 'notify',
}

local M = {}
for _, plugin_name in ipairs(plugins) do
	local path = string.format('ly.plugins.%s', plugin_name)
	table.insert(M, require(path))
end

return M
