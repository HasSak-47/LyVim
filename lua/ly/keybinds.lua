local wk = require('which-key')
local key_register = {
	['<C-j>'] = { '<C-W>j', 'change to _ window' },
	['<C-k>'] = { '<C-W>k', 'change to _ window' },
	['<C-l>'] = { '<C-W>l', 'change to _ window' },
	['<C-h>'] = { '<C-W>h', 'change to _ window' },

	['<leader>'] = {
		a = {
			name = 'aesthetic',
			t = {':Twilight<CR>', 'toggle twilight'},
		}
	},
}

local hm_ok, mark = pcall(require, 'harpoon.mark')
local hu_ok, ui = pcall(require, 'harpoon.mark')
if hm_ok and hu_ok then
	table.insert(key_register['<leader>'], {
		h = {
			name = 'harpoon',
			a = {mark.add_file, 'add file'},
			m = {ui.toggle_quick_menu, 'toggle quick menu'},
		}
	})
end

local b_ok, builtin = pcall(require, 'telescope.builtin')
if b_ok then
	table.insert(key_register['<leader>'], {
		t = {
			name = 'telescope',
			f = {builtin.find_files, 'find files'},
			g = {builtin.git_files, 'find git files'},
		}
	})
end

local t_ok, nvim_tree = pcall(require, 'nvim-tree.api')
if t_ok then
	table.insert(key_register['<leader>'], {
		e = { nvim_tree.tree.toggle, 'explorer', },
	})
end


wk.register( key_register )
