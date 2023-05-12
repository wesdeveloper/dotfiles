require("plugins-setup")
require("core.options")
require("core.keymaps")
require("core.colorscheme")
require("plugins.comment")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.nvim-cmp")
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
require("plugins.autopairs")
require("plugins.treesitter")
require("plugins.gitsigns")
require("plugins.transparent")
require("plugins.lspsignature")
require("plugins.dap")
require("plugins.indent-blankline")

vim.cmd([[
function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':~:t')
  let path = empty(path) ? 'no-project' : path
  return substitute(path, '/', '-', 'g')
endfunction

autocmd VimLeavePre *             silent execute 'SSave! ' . GetUniqueSessionName()
]])
