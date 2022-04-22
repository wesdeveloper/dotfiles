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
  use 'xiyaowong/nvim-transparent'

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

  -- debugger
  use "Pocco81/DAPInstall.nvim"
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'David-Kunz/jester'

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

  -- use {"glepnir/galaxyline.nvim"}

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
  use 'iamcco/markdown-preview.nvim'
  use 'terryma/vim-multiple-cursors'
  use 'ray-x/lsp_signature.nvim'

  use { 'francoiscabrol/ranger.vim', requires = {'rbgrouleff/bclose.vim'} }
  use 'vim-syntastic/syntastic'
  use 'sbdchd/neoformat'
  use 'folke/lsp-colors.nvim'
  use 'f-person/git-blame.nvim'
  use {"akinsho/toggleterm.nvim"}

-- Lua
use "folke/which-key.nvim"
use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
}

use 'nvim-lualine/lualine.nvim'

use {
  'NTBBloodbath/rest.nvim',
  requires = { 'nvim-lua/plenary.nvim' }
}

use 'folke/trouble.nvim'

end
)

