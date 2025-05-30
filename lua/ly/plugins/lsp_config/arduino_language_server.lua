local M = { }

local err, arduino = pcall(require, 'arduino')
if err then
	return M
end
arduino.setup({
	clangd = "/bin/clangd",
	arduino = "/bin/arduino-cli",

	extra_ops = { ... }
})

return M
