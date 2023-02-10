enabled_plugins = {}
local plugins = {
	'explorer',
	'completion',
	'mason',
	'lsp'
}

require 'lilith.config.lsp'

for k, v in pairs(plugins) do
	local s = string.format('lilith.config.%s', v)
	local l = pcall(require, s)
	print(s)
	if l == true then
		table.insert(enabled_plugins, v)
	end
end

