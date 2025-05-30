local opts = {remap = false}
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>pf", builtin.find_files, opts)
vim.keymap.set("n", "<C-p>", builtin.git_files, opts)
vim.keymap.set("n", "<leader>ps", function() 
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end
, opts)
