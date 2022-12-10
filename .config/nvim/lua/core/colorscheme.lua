local status, _ = pcall(vim.cmd, "colorscheme vim-monokai-tasty")
if not status then
	print("Colorscheme not found!")
	return
end

vim.cmd("let g:vim_monokai_tasty_italic = 1")
vim.cmd("let g:lightline = { 'colorscheme': 'monokai_tasty' }")
vim.cmd("let g:airline_theme='monokai_tasty'")
