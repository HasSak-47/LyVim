vim.api.nvim_create_autocmd("FileType", {
	pattern = {"javascript", "javascriptreact","typescript", "typescriptreact"},
	callback = function ()
		vim.opt.tabstop     = 2
		vim.opt.shiftwidth  = 2
		vim.opt.softtabstop = 2
		vim.opt.expandtab   = false
	end
})

local M = {
   init_options = {
   },
   filetypes = {
     "javascript",
     "typescript",
     "vue",
   },
}

return M
