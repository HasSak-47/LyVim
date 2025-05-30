local opts = {remap = false}
vim.g.mapleader = " "


vim.keymap.set("n", "<C-j>", '<C-w>j', opts)
vim.keymap.set("n", "<C-k>", '<C-w>k', opts)
vim.keymap.set("n", "<C-l>", '<C-w>l', opts)
vim.keymap.set("n", "<C-h>", '<C-w>h', opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>pf", builtin.find_files, opts)
vim.keymap.set("n", "<C-p>", builtin.git_files, opts)
vim.keymap.set("n", "<leader>ps", function() 
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end
, opts)

-- harpoon
local h_ui   = require('harpoon.ui')
local h_mark = require('harpoon.mark')
vim.keymap.set("n", "<leader>a", h_mark.add_file)
vim.keymap.set("n", "<C-e>", h_ui.toggle_quick_menu)

for i=0,9 do
	local keybind = string.format("<C-%d>", i)
	vim.keymap.set("n", keybind, function() h_ui.nav_file(i) end)
end

-- nvim tree
vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<C-A-k>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-A-j>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-A-h>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-A-l>", ":vertical resize -2<CR>", opts)
