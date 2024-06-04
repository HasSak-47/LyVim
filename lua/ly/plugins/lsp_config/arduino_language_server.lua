local M = { }

local err, arduino = pcall(require, 'arduino')
if err then
	return M
end

arduino.setup{
	cmd = {
		"-cli-config", "/home/lilith/.arduino15/arduino-cli.yaml",

	}
}

return M
