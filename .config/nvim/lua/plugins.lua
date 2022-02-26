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
  use 'wbthomason/packer.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- initial screen
  use 'mhinz/vim-startify'

  -- -- colorscheme
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nathanaelkane/vim-indent-guides'
  use 'patstockwell/vim-monokai-tasty'
  use 'HerringtonDarkholme/yats.vim'
  use 'pangloss/vim-javascript'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'styled-components/vim-styled-components'
  use 'elzr/vim-json'
  use 'jparise/vim-graphql'

  -- nvim-tree
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'sindrets/diffview.nvim'

  -- lsp
  use {
    'neovim/nvim-lspconfig', opt = true,
    'williamboman/nvim-lsp-installer',
  }
  use 'tami5/lspsaga.nvim'
  use 'mattn/vim-lsp-icons'
  use 'onsails/lspkind-nvim'


  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use {"hrsh7th/vim-vsnip"}
  use {"rafamadriz/friendly-snippets", opt = true}
  use 'windwp/nvim-autopairs'

  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-fugitive'
  use 'editorconfig/editorconfig-vim'
  use 'kevinhwang91/rnvimr'
  use 'preservim/tagbar'

  use {"glepnir/galaxyline.nvim"}

  use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("colorizer").setup()
            vim.cmd("ColorizerReloadAllBuffers")
        end
    }

  use 'romgrk/barbar.nvim'
  use 'machakann/vim-highlightedyank'
  use 'mhinz/vim-signify'
  use 'iamcco/markdown-preview.nvim'
  use 'terryma/vim-multiple-cursors'
  use 'ray-x/lsp_signature.nvim'

  use 'eliba2/vim-node-inspect'

  use "Pocco81/DAPInstall.nvim"
  use { 'francoiscabrol/ranger.vim', requires = {'rbgrouleff/bclose.vim'} }
  use 'vim-syntastic/syntastic'
  use 'sbdchd/neoformat'
  use 'folke/lsp-colors.nvim'
  use 'f-person/git-blame.nvim'
  -- use {'neoclide/coc.nvim', branch = 'release'}
  use {"akinsho/toggleterm.nvim"}

-- Lua
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      {
        plugins = {
          marks = true, -- shows a list of your marks on ' and `
          registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          -- the presets plugin, adds help for a bunch of default keybindings in Neovim
          -- No actual key bindings are created
          spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
          },
          presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
          },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments" },
        key_labels = {
          -- override the label used to display some keys. It doesn't effect WK in any other way.
          -- For example:
          -- ["<space>"] = "SPC",
          -- ["<cr>"] = "RET",
          -- ["<tab>"] = "TAB",
        },
        icons = {
          breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
          separator = "➜", -- symbol used between a key and it's label
          group = "+", -- symbol prepended to a group
        },
        window = {
          border = "none", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 3, -- spacing between columns
          align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specify a list manually
        triggers_blacklist = {
          -- list of mode / prefixes that should never be hooked by WhichKey
          -- this is mostly relevant for key maps that start with a native binding
          -- most people should not need to change this
          i = { "j", "k" },
          v = { "j", "k" },
        },
      }

    }
  end
}
use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
}

use {
  'NTBBloodbath/rest.nvim',
  requires = { 'nvim-lua/plenary.nvim' }
}
end
)

