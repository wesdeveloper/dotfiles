-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "mr", ":lua require('rest-nvim').run()<CR>")
keymap.set("n", "mrd", ":lua require('rest-nvim').run(true)<CR>")
keymap.set("n", "f", ":Neoformat eslint_d<CR>")

keymap.set("n", "t", ":BufferNext<CR>") --  go to next buffer
keymap.set("n", "tp", ":BufferPrevious<CR>") --  go to previous buffer
keymap.set("n", "tc", ":BufferClose!<CR>") -- close current buffer
keymap.set("n", "qq", ":q<CR>") -- quite

keymap.set("n", "<Tab>", ">>")
keymap.set("n", "<S-Tab>", "<<")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
-- keymap.set("n", "<leader>e", ":Neotree filesystem reveal toggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })

keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")
