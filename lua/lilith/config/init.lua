enabled_plugins = {}
local plugins = {
	'explorer',
	'completion',
	'mason',
	'lsp'
}

for _, v in pairs(plugins) do
	local s = string.format('lilith.config.%s', v)
	local l = pcall(require, s)
	if l then
		table.insert(enabled_plugins, v)
	end
end

