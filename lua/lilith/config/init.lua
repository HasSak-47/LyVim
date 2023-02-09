enabled_plugins = {}
local plugins = {
	'nvim-tree',
	'nvim-cmp'
}

for k, v in pairs(plugins) do
	local s = string.format('lilith.config.%s', v)
	local l = pcall(require, s)
	if l == true then
		table.insert(enabled_plugins, v)
	end
end

