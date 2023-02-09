if vim.fn.exists('g:neovide') == 1 then
	require 'lilith.neovide'
end

require 'lilith.config'

require 'lilith.options'
require 'lilith.plugins'
require 'lilith.keymaps'
require 'lilith.theme'
