local devicons, ok = pcall(require, "nvim-web-devicons")
if not ok then
	print('devicons')
end

local opts = {
	override = {
		txt = {
			icon = "󰊄",
    		color = "#89e051",
    		cterm_color = "113",
    		name = "Txt",
		}	
	}
}

devicons.setup(opts)
