local M = {
    'lukas-reineke/indent-blankline.nvim',
	main = 'ibl',
    config = function()
        require("ibl").setup({
			scope = {
				enabled = true,
			},
			indent = {
                tab_char = '▎',
				char = "▎", -- I wanna add dots to the space indent but i don't know how to yet
				repeat_linebreak = true,
			}
		})
    end
}

return M
