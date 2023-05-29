vim.lsp.set_log_level('debug')
require "lilith.impatient"
require "lilith.options"
require "lilith.keymaps"
require "lilith.plugins"
require "lilith.autocommands"
require "lilith.colorscheme"
require "lilith.cmp"
require "lilith.telescope"
require "lilith.gitsigns"
require "lilith.treesitter"
require "lilith.autopairs"
require "lilith.comment"
require "lilith.nvim-tree"
require "lilith.bufferline"
require "lilith.lualine"
require "lilith.toggleterm"
require "lilith.project"
require "lilith.illuminate"
require "lilith.indentline"
require "lilith.alpha"
require "lilith.lsp"
require "lilith.dap"

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
