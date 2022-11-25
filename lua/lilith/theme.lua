

local index = 1
local themes = {
	"sonokai",
	"slate",
	"default",
}
local opts = { noremap = true, silent = true}

change_theme = function()
	theme = themes[index]
	print("theme : " .. theme) 
	index = index + 1
	index = 1 + (index % 3)
	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
	
	if not status_ok then
		vim.notify("colorscheme " .. theme .. " not fount")
		return
	end
end

change_theme()
vim.keymap.set('n', "<C-1>", change_theme, opts)
