-- [[stuff that needs all the configs or maybe it doesn't]]
require('lilith.options')
require('lilith.plugins')

plugin_map = {}
require('lilith.config.bufferline')
require('lilith.config.cmp')
require('lilith.config.neovide')
require('lilith.config.nvim-tree')
require('lilith.config.treesitter')
require('lilith.config.lsp')

require('lilith.keymaps')
require('lilith.theme')

--require('lilith.custom.header')

if vim.fn.exists('g:neovide') == 1 then
	require('lilith.config.neovide')
end
