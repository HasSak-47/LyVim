
-- [[neovide configuration]] 
vim.g.neovide_transparency = 1.0
vim.g.neovide_remember_window_size = true
vim.g.neovide_floating_blur_amount_x = 0.1
vim.g.neovide_floating_blur_amount_y = 0.1
vim.g.neovide_fullscreen = true

-- [[font stuff]]
vim.g.gui_font_default_size = 10
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Fira Code Retina"

vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)

local opts = { noremap = true, silent = true}

resize_gui_font = function(delta)
	vim.g.gui_font_size = delta + vim.g.gui_font_size
	vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

change_gui_trans = function(delta)
	if(vim.g.neovide_tranparency == nil) then
		vim.g.neovide_tranparency = 1.0
	end
	if(vim.g.neovide_tranparency < 1.0 or vim.g.neovide_tranparency > 0.0) then
		print(vim.g.neovide_transparency)
		vim.g.neovide_transparency = vim.g.neovide_transparency + delta 
	end
end
