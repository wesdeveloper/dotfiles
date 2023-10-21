local opt = vim.opt -- for conciseness

vim.cmd("syntax on") -- syntax highlighting
vim.cmd("filetype plugin on") -- filetype detection
vim.cmd("let g:startify_change_to_dir = 0")

vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.mouse = "a" -- Enable your mouse
vim.bo.smartindent = true -- Makes indenting smart
vim.o.showmode = true
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.title = true
vim.o.updatetime = 300 -- Faster completion
vim.cmd("set noswapfile")
vim.cmd("set foldmethod=indent")
vim.cmd("set foldlevel=99")

vim.cmd("set incsearch")
vim.o.hlsearch = false

-- line numbers
opt.number = true
opt.relativenumber = true

-- tab & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

vim.g.gitblame_enabled = 0

vim.o.scrolloff = 999
vim.o.sidescrolloff = 5

opt.iskeyword:append("-")
