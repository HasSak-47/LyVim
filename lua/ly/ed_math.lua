local wk = require("which-key")
wk.register({
	["<leader>"] = {
		l = {
			name = "write latex",
			o = { "i$$\\begin{aligned}\n\\end{aligned}$$<esc>", "obsidian block" },
			i = { "i\\int_a^b{}{d}<esc>", "integral" },
			f = { "i\\frac{}{}<esc>", "fraction" },
		},
	},
})
