local M = {
    'folke/which-key.nvim',
    init = function ()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require('which-key')

		wk.setup()
		local mark = require('harpoon.mark')
		local ui = require('harpoon.ui')

		local wk = require('which-key')
		-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
		-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
		-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
		-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
		wk.register({
			h = {
				name = 'harpoon',
				a = {mark.add_file, 'add file'},
				m = {ui.toggle_quick_menu, 'toggle quick menu'},
			}

		})


    end,
}

return M
