require('plugins')
require('settings')
require('keymappings')

require('plugins-config/galaxyline')
require('plugins-config/lspconfig')
require('plugins-config/nvim-tree')
require('plugins-config/nvim-cmp')
require('plugins-config/which-key')
require('plugins-config/lsp-saga')
require('plugins-config/nvim-treesitter')
require('plugins-config/lspsignature')
require('plugins-config/indent-brankline')
require('plugins-config/autopairs')
require('plugins-config/rest-nvim')
require('plugins-config/lspkind')
require('plugins-config/toggleterm')

-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
