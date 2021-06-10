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
    use 'dense-analysis/ale'

  end
)

