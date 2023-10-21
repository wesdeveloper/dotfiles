local status, _ = pcall(vim.cmd, "colorscheme vim-monokai-tasty")
if not status then
	print("Colorscheme not found!")
	return
end

-- vim.cmd("let g:vim_monokai_tasty_italic = 1")
-- vim.cmd("let g:lightline = { 'colorscheme': 'ayu-mirage' }")
-- vim.cmd("let g:airline_theme='ayu-mirage'")

vim.cmd("set background=dark")
vim.cmd("let g:ayucolor='mirage'")
-- vim.cmd("let g:airline_theme='ayu-mirage'")
-- set background=light    " for light version of theme
-- set background=dark     " for either mirage or dark version.
-- " NOTE: `background` controls `g:ayucolor`, but `g:ayucolor` doesn't control `background`
--
-- let g:ayucolor="mirage" " for mirage version of theme
-- let g:ayucolor="dark"   " for dark version of theme
