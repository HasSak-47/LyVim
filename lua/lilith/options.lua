local opt = vim.opt

local options = {
	number = true,
	relativenumber = true,


	encoding = "utf8",
	fileencoding = "utf8",

	clipboard = "unnamedplus",  -- system clipboard

	expandtab = false, -- makes tabs be the \t character instead of spaces
	shiftwidth = 4,
	softtabstop = 4,
	tabstop = 4,

	scrolloff = 8,
	showtabline = 2,

	mouse = "a",
	guifont = "fira:10",

	syntax = "on",
	termguicolors = true,

	splitright = false,		-- splits to the left
}

-- OOhhh for loop in a config file
-- Sheeesh
for k, v in pairs(options) do
	vim.opt[k] = v
end
