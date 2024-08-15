vim.opt.clipboard   = "unnamedplus"

vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4

local ft = vim.bo.filetype

if ft ~= 'gdscript' or ft ~='makefile' then
    vim.opt.expandtab = true
else
    vim.opt.expandtab = false
end

vim.opt.breakindent = true

vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.hlsearch  = false
vim.opt.incsearch = false

vim.opt.scrolloff = 8
vim.opt.wrap = false
