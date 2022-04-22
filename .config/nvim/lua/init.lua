require('plugins')
require('settings')
require('keymappings')

require('plugins-config/lualine')
-- require('plugins-config/galaxyline')
require('plugins-config/lspconfig')
require('plugins-config/nvim-tree')
-- require('plugins-config/nvim-cmp')
require('plugins-config/which-key')
require('plugins-config/lsp-saga')
require('plugins-config/nvim-treesitter')
require('plugins-config/lspsignature')
require('plugins-config/indent-brankline')
require('plugins-config/autopairs')
require('plugins-config/lspkind')
require('plugins-config/toggleterm')
require('plugins-config/nvim-dap')
require('plugins-config.gitsigns')
require('plugins-config/rest-nvim')


-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})


require'nvim-web-devicons'.setup()
require'nvim-web-devicons'.get_icons()
