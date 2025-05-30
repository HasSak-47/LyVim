
local wk = require('which-key')
wk.add {
	{'<C-j>', '<C-W>j', desc = 'change to _ window' },
	{'<C-k>', '<C-W>k', desc = 'change to _ window' },
	{'<C-l>', '<C-W>l', desc = 'change to _ window' },
	{'<C-h>', '<C-W>h', desc = 'change to _ window' },

	{'<C-A-j>', ':resize -2<CR>', desc = 'resize window' },
	{'<C-A-k>', ':resize +2<CR>', desc = 'resize window' },
	{'<C-A-l>', ':vertical resize -2<CR>', desc = 'resize window' },
	{'<C-A-h>', ':vertical resize +2<CR>', desc = 'resize window' },

	{'<leader>a', group='aesthetic'},
	{'<leader>at' ,':Twilight<CR>', desc = 'toggle twilight'},
	{'<leader>ar' ,':set relativenumber!<CR>', desc = 'toggle relnum'},
}

local hm_ok, mark = pcall(require, 'harpoon.mark')
local hu_ok, ui = pcall(require, 'harpoon.mark')
if hm_ok and hu_ok then
	wk.add{
		{'<leader>h', group = 'harpoon'},
		{'<leader>ha', mark.add_file, desc = 'add file'},
		{'<leader>hu', ui.toggle_quick_menu, desc ='toggle quick menu'},
	}
end

local b_ok, builtin = pcall(require, 'telescope.builtin')
if b_ok then
	wk.add{
		{'<leader>t', group = 'telescope'},
		{'<leader>tf', builtin.find_files, desc = 'find files'},
		{'<leader>tg', builtin.git_files, desc = 'find git files'},
	}
end

local t_ok, nvim_tree = pcall(require, 'nvim-tree.api')
if t_ok then
	wk.add{'<leader>e',
		nvim_tree.tree.toggle,
		desc = 'explorer',
	}
end
