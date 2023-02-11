local M = {
	set_keymap = {
		leader = ' ',
		-- should change name later
		window = {
			resize = {
				hor_inc = '<A-k>',
				hor_dec = '<A-j>',
				ver_inc = '<A-h>',
				ver_dec = '<A-l>'
			},
			navigation = {
				h = '<C-h>',
				j = '<C-j>',
				k = '<C-k>',
				l = '<C-l>'
			}
		},
		buffer = {
			prev = '<S-h>',
			next = '<S-h>'
		}
	},
	buf_keymap = {},
	insert_escape = 'jk',

	neovide = {
		font = {
			inc = 'nz+',
			dec = 'nz-'
		},
		trans = {
			inc = 'nz+',
			dec = 'nz-'
		}
	},

	theme = {
		change = '<C-1>'
	},
	compleation = {
		prev_item = '<A-k>',
		next_item = '<A-j>',

		comfirm_selection = '<CR>'
	}
}

return M
