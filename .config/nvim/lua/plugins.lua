local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(
function()
  -- Packer can manage itself as an optional plugin
  use "wbthomason/packer.nvim"

  -- initial screen
  use 'mhinz/vim-startify'

  -- colorscheme
  use 'nathanaelkane/vim-indent-guides'
  use 'patstockwell/vim-monokai-tasty'

  -- nvim-tree
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use {"hrsh7th/vim-vsnip"}
  use {"rafamadriz/friendly-snippets", opt = true}

  use 'scrooloose/nerdcommenter'
  use 'zivyangll/git-blame.vim'
  use 'tpope/vim-fugitive'
  use 'editorconfig/editorconfig-vim'
  use 'kevinhwang91/rnvimr'
  use 'preservim/tagbar'

  -- airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'


  use 'romgrk/barbar.nvim'
  use 'machakann/vim-highlightedyank'
  use 'mhinz/vim-signify'
  use 'airblade/vim-gitgutter'
  use 'HendrikPetertje/vimify'
  use 'iamcco/markdown-preview.nvim'
  use 'terryma/vim-multiple-cursors'
  -- use 'dense-analysis/ale'
  use {"folke/which-key.nvim", opt = true}
  use 'davidgranstrom/nvim-markdown-preview'
  use 'ray-x/lsp_signature.nvim'
  
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        {
          position = "bottom", -- position of the list can be: bottom, top, left, right
          height = 10, -- height of the trouble list when position is top or bottom
          width = 50, -- width of the list when position is left or right
          icons = true, -- use devicons for filenames
          mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
          fold_open = "", -- icon used for open folds
          fold_closed = "", -- icon used for closed folds
          action_keys = { -- key mappings for actions in the trouble list
          -- map to {} to remove a mapping, for example:
          -- close = {},
          close = "q", -- close the list
          cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r", -- manually refresh
          jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
          open_split = { "<c-x>" }, -- open buffer in new split
          open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
          open_tab = { "<c-t>" }, -- open buffer in new tab
          jump_close = {"o"}, -- jump to the diagnostic and close the list
          toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
          toggle_preview = "P", -- toggle auto_preview
          hover = "K", -- opens a small poup with the full multiline message
          preview = "p", -- preview the diagnostic location
          close_folds = {"zM", "zm"}, -- close all folds
          open_folds = {"zR", "zr"}, -- open all folds
          toggle_fold = {"zA", "za"}, -- toggle fold of current file
          previous = "k", -- preview item
          next = "j" -- next item
        },
        indent_lines = true, -- add an indent guide below the fold icons
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = false, -- automatically close the list when you have no diagnostics
        auto_preview = true, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = false, -- automatically fold a file trouble list at creation
        signs = {
          -- icons / text used for a diagnostic
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "﫠"
        },
        use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
      }
    }
  end
}

end
)

