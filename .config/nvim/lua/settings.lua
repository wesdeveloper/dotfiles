vim.cmd('syntax on') -- syntax highlighting
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.bo.smartindent = true -- Makes indenting smart
vim.cmd('filetype plugin on') -- filetype detection
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = true
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.title = true
vim.cmd('set noswapfile')

vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.background = 'dark'
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.completeopt = 'menuone,noinsert,noselect'

vim.wo.number = true
vim.wo.wrap = false

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

vim.g.mapleader = ' '
vim.b.mapleader = ' '

vim.cmd('language en_US.utf-8')
vim.wo.list = true
vim.o.listchars = 'tab:┆·,trail:·,precedes:,extends:'

vim.g.markdown_fenced_languages = {'sh', 'vim'}

vim.g.termbufm_direction_cmd = 'new'

-- colorscheme
vim.cmd('let g:vim_monokai_tasty_italic = 1')
vim.cmd('colorscheme vim-monokai-tasty')


-- background transparent
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
