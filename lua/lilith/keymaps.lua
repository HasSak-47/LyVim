local opts = {noremap = true, silent = false}
local keymap = vim.api.nvim_set_keymap

-- [[ leader remapping ]]
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ explorer ]]
local ntre_toggle = ":NvimTreeToggle<CR>"
local nlex_toggle = ":Lex 30<CR>"
local toggle = nlex_toggle

if enabled_plugins ~= nil then
for k, v in pairs(enabled_plugins) do
	if v == 'nvim-tree' then
		toggle = ntre_toggle
	end
end
end

keymap("n", "<leader>e", toggle, opts)
--keymap("n", "<leader>er", ":NvimTreeRefresh<CR>", opts)

-- [[ resize 'window' size ]]
keymap("n", "<A-k>", ":resize -2<CR>", opts)
keymap("n", "<A-j>", ":resize +2<CR>", opts)
keymap("n", "<A-h>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-l>", ":vertical resize -2<CR>", opts)


-- [[ normal mode ]]
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
keymap("n", "<leader>reaload", ":source $MYVIMRC<cr>", opts)
