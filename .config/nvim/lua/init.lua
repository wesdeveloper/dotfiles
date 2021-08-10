require('plugins')
require('settings')
require('keymappings')

require('plugins-config/galaxyline')
require('plugins-config/lspconfig')
require('plugins-config/nvim-tree')
require('plugins-config/compe')
require('plugins-config/which-key')
require('plugins-config/lsp-saga')
require('plugins-config/diagnostics')
require('plugins-config/nvim-treesitter')
require('plugins-config/lspsignature')
require('plugins-config/nvim-dap')

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})

-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})


local dap_install = require("dap-install")

dap_install.setup({
	installation_path = "/tmp/test_dap_install/",
	verbosely_call_debuggers = false,
})


dap_install.config("jsnode_dbg", {})
-- dap_install.config("", {})
