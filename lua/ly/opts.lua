vim.opt.clipboard   = "unnamedplus"

vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4


local ft = vim.bo.filetype

if ft ~= 'gdscript' then
    vim.opt.expandtab = false
else
    vim.opt.expandtab = true
end

vim.opt.breakindent = true

vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.hlsearch  = false
vim.opt.incsearch = false

vim.optscrolloff = 8
