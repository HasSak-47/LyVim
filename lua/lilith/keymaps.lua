local opts = {noremap = true, silent = false}
local keymap = vim.api.nvim_set_keymap

-- [[ leader remapping ]]
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ explorer ]]
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>er", ":NvimTreeRefresh<CR>", opts)


-- [[normal mode]]
-- [[ navigation ]]
	-- [[window navigation]]
	-- it's like the navigation of i3
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

	-- [[buffer navigation]]
keymap("n", "<S-h>", ":bprevious<cr>", opts)
keymap("n", "<S-l>", ":bnext<cr>", opts)


-- [[insert mode]]
keymap("i", "jk", "<esc>", opts)
