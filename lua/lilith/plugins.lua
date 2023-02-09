-- I should really add lazy loading
-- but I won't bc I am lazy

local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print("installing packer close and reopen nvim")
	vim.cmd [[packeradd packer.nvim]]
end

-- install everything every time you save 
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("packer is not ok :c")
	return
end

packer.init {
	display = {
 		open_fn = function()
			return require("packer.util").float{ border = "rounded" }
		end,
	}
}


return packer.startup(
	function(use)
		-- [[plugins]]

		-- libraries/necesary pluggings
		use {"wbthomason/packer.nvim"}			-- packer itself
		use {"nvim-lua/popup.nvim"}				-- An implementation of the Popup API from vim in Neovim
		use {"nvim-lua/plenary.nvim"}			-- Useful lua functions used by lots of plugins
		use {"L3MON4D3/LuaSnip"}				-- snippet engine
		use {"rafamadriz/friendly-snippets"}	-- bunch of snippet completions

		-- completion stuff
		use {"hrsh7th/nvim-cmp"}				-- the completion plugin and its addons
		use {"hrsh7th/cmp-buffer"}
		use {"hrsh7th/cmp-path"}
		use {"hrsh7th/cmp-cmdline"}
		use {"hrsh7th/cmp-nvim-lsp"}
		use {"hrsh7th/cmp-nvim-lua"}
		use {"saadparwaiz1/cmp_luasnip"}

		-- nice themes
		use {"sainnhe/sonokai"}

		-- treesitter nice syntax highlighting
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		}
		use { "p00f/nvim-ts-rainbow" }
		use { "nvim-treesitter/playground" }

		-- telescope
		use {"nvim-telescope/telescope.nvim"}

		-- explorer
		use {'kyazdani42/nvim-web-devicons'}
		use {'kyazdani42/nvim-tree.lua'}

		-- lsp stuff
		use {"neovim/nvim-lspconfig"}
		use {"williamboman/nvim-lsp-installer"}

		-- bufferline stuff
		use {"akinsho/bufferline.nvim"}
		use {"moll/vim-bbye"}

		-- idk why this is but meh
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end
)
