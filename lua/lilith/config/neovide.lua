-- [[neovide configuration]] 
vim.g.neovide_transparency = 1.0
vim.g.neovide_remember_window_size = true

-- [[font stuff]]
vim.g.gui_font_default_size = 10
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Fira Code Retina"

local opts = { noremap = true, silent = true}

refresh_gui_font = function()
	vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

resize_gui_font = function(delta)
	print()
	vim.g.gui_font_size = delta + vim.g.gui_font_size
	print("changing the size by " .. tostring(delta) .. " size is " .. tostring(vim.g.gui_font_size))
	refresh_gui_font()
end

refresh_gui_font()

vim.keymap.set({'n', 'i'}, "<C-+>", function() resize_gui_font(1) end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() resize_gui_font(-1) end, opts)
