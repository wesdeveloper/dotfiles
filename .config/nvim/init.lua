require("core.options")
require("core.keymaps")
require("plugins-setup")
-- require("core.colorscheme")
-- require("plugins.comment")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.nvim-cmp")
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
require("plugins.autopairs")
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
autocmd BufNewFile,BufRead *.http set syntax=javascript
]])

vim.opt.termguicolors = true
require("bufferline").setup({})

-- vim.cmd([[
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
-- augroup END
-- ]])
