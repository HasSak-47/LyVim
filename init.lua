-- bootstrap lazy.nvim

LANG = "es"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
-- remove the kinda annoying cmdline command
vim.api.nvim_set_keymap("n", "q:", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "q?", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "q/", "<Nop>", { noremap = true, silent = true })

require("ly.autocmds")
require("ly.opts")
require("ly.lazy")
