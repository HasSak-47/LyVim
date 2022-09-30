local theme = "sonokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme)

if not status_ok then
	vim.notify("colorscheme " .. theme .. " not fount")
	return
end
