local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('harpoon').setup{}
    end

}

return M
