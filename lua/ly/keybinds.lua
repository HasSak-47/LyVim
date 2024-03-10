local opts = {remap = false}
local wk = require('which-key')
local builtin = require('telescope.builtin')
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- local shade = require('shade')

vim.g.mapleader = " "

local register = {
}

wk.register( {
	-- window navigation
	['<C-j>'] = { '<C-W>j', 'change to _ window' },
	['<C-k>'] = { '<C-W>k', 'change to _ window' },
	['<C-l>'] = { '<C-W>l', 'change to _ window' },
	['<C-h>'] = { '<C-W>h', 'change to _ window' },

	['<leader>'] = {
		-- telescope
		t = {
			name = 'telescope',
			f = {builtin.find_files, 'find files'},
			g = {builtin.git_files, 'find git files'},
			p = {':Telescope projects<CR>', 'show projects'}
		},
		-- tree
		e = {
			':NvimTreeToggle<CR>',
			'explorer',
		},
		-- harpoon
		h = {
			name = 'harpoon',
			a = {mark.add_file, 'add file'},
			m = {ui.toggle_quick_menu, 'toggle quick menu'},
		},
		s = {
			name = 'lsp/symbol',
			r = { ':lua vim.lsp.buf.rename(\'\')', 'rename symbol' }

		},
		-- aesthetic
		-- a = {
		-- 	name = 'aesthetic',
		-- 	t = {':Twilight<CR>', 'toggle twilight'},
		-- 	s = {shade.toggle, 'toggle Shade'}
		-- },
		-- project manager
		p = {
			name = 'project',
		},
		-- symbol stuff
	},
	-- resize windows
	['<C-A-k>'] = {":resize -2<CR>", 'resize h +2'},
	['<C-A-j>'] = {":resize +2<CR>", 'resize h -2'},
	['<C-A-h>'] = {":vertical resize +2<CR>", 'resize v +2'},
	['<C-A-l>'] = {":vertical resize -2<CR>", 'resize v -2'},
})

