-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- jump between methods
vim.api.nvim_set_keymap('n', '<Space>jbnm', ']m', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>jbpm', '[m', { noremap = true, silent = true })
