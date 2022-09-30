local opts = {noremap = true, silent = false}

write_header = function()
	local path = vim.fn.bufname("%")
	print(vim.match("include", path))
end

vim.keymap.set('n', "<leader>h", write_header, opts)
