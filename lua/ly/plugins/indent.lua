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
				char = "-",
				repeat_linebreak = true,
			}
		})
    end
}

return M
