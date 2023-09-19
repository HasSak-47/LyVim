-- bootstrap lazy.nvim

LANG="es"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if  not vim.loop.fs_stat(lazypath) then
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

local plugins = require('ly.lazy')
require('lazy').setup(plugins)

require('ly.keybinds')
require('ly.opts')
require('ly.ed_math')
