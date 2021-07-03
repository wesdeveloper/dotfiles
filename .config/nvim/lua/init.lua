require('plugins')
require('settings')
require('keymappings')

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
